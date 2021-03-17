//
//  HomeCell.swift
//  W1-Project1-Gumi
//
//  Created by Thành Nguyên on 16/03/2021.
//

import UIKit

class HomeCell: UICollectionViewCell {

    //Outlets
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
    }
    
    func bindData(fruit: Fruit) {
        iconLabel.text = fruit.icon
        nameLabel.text = fruit.name
        backgroundColor = fruit.backgroundColor
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib : UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

}
