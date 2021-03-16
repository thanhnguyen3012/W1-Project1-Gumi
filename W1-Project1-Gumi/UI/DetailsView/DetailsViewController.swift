//
//  DeatailsViewController.swift
//  W1-Project1-Gumi
//
//  Created by Thành Nguyên on 16/03/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var qualityLabel: UILabel!
    @IBOutlet weak var weighSlider: UISlider!
    @IBOutlet weak var weighLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var isLovedButton: UIButton!
    @IBOutlet weak var star1ImageView: UIImageView!
    @IBOutlet weak var star2ImageView: UIImageView!
    @IBOutlet weak var star3ImageView: UIImageView!
    @IBOutlet weak var dashedLineView: UIView!
    
    //Data
    var fruit = Fruit()

    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Details"
        
        view.backgroundColor = fruit.backgroundColor
        
        detailsView.roundCorners([.topLeft,.topRight], radius: 30)
        
        iconLabel.text = fruit.icon
        
        nameLabel.text = fruit.name
        
        switch fruit.rate {
        case 0:
            qualityLabel.text = "Low Quality"
            star1ImageView.image = UIImage(systemName: "star", withConfiguration: .none)
            star2ImageView.image = UIImage(systemName: "star", withConfiguration: .none)
            star3ImageView.image = UIImage(systemName: "star", withConfiguration: .none)
            qualityLabel.text = "Standard Quality"
            star1ImageView.image = UIImage(systemName: "star.fill", withConfiguration: .none)
            star2ImageView.image = UIImage(systemName: "star", withConfiguration: .none)
            star3ImageView.image = UIImage(systemName: "star", withConfiguration: .none)
        case 2:
            qualityLabel.text = "High Quality"
            star1ImageView.image = UIImage(systemName: "star.fill", withConfiguration: .none)
            star2ImageView.image = UIImage(systemName: "star.fill", withConfiguration: .none)
            star3ImageView.image = UIImage(systemName: "star", withConfiguration: .none)
        default:
            qualityLabel.text = "Best Quality"
            star1ImageView.image = UIImage(systemName: "star.fill", withConfiguration: .none)
            star2ImageView.image = UIImage(systemName: "star.fill", withConfiguration: .none)
            star3ImageView.image = UIImage(systemName: "star.fill", withConfiguration: .none)
        }
        
        weighLabel.text = "\(fruit.weigh)g"
        
        weighSlider.setValue(Float(fruit.weigh), animated: false)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.lineCap = .round
        shapeLayer.lineDashPattern = [1, 20] // 1 is the length of dash, 20 is length of the gap.
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: dashedLineView.bounds.minX, y: dashedLineView.bounds.minY), CGPoint(x: dashedLineView.bounds.maxX, y: dashedLineView.bounds.minY)])
        shapeLayer.path = path
        dashedLineView.layer.addSublayer(shapeLayer)
        
        originLabel.text = fruit.origin
        
        priceLabel.text = "\(fruit.price)$"
        
        isLovedButton.isSelected = fruit.isLoved
        isLovedButton.setTitleColor(UIColor(red: 223/255, green: 76/255, blue: 87/255, alpha: 1), for: .normal)
        isLovedButton.setBackgroundImage(UIImage(systemName: "heart.circle", withConfiguration: .none), for: .normal)
        isLovedButton.setBackgroundImage(UIImage(systemName: "heart.circle.fill", withConfiguration: .none), for: .selected)
    }
    
    @IBAction func loveTouched(_ sender: Any) {
        isLovedButton.isSelected = !isLovedButton.isSelected
    }
}