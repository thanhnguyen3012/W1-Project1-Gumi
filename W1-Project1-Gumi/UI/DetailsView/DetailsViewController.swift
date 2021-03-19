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
    @IBOutlet weak var starOneImageView: UIImageView!
    @IBOutlet weak var starTwoImageView: UIImageView!
    @IBOutlet weak var starThreeImageView: UIImageView!
    @IBOutlet weak var dashedLineView: UIView!
    
    //Data
    private var fruit = Fruit(icon: "", name: "", rate: 0, weigh: 0, origin: "", price: 0, isLoved: false, color: .white)

    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Details"
        confgiUI()
        reloadData()       
    }
    
    func confgiUI() {
        view.backgroundColor = fruit.backgroundColor
        
        detailsView.clipsToBounds = true
        detailsView.layer.cornerRadius = 50
        detailsView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        //Draw the dashed line for Slider
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.lineCap = .round
        shapeLayer.lineDashPattern = [1, 20] // 1 is the length of dash, 20 is length of the gap.
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: dashedLineView.bounds.minX, y: dashedLineView.bounds.minY), CGPoint(x: dashedLineView.bounds.maxX, y: dashedLineView.bounds.minY)])
        shapeLayer.path = path
        dashedLineView.layer.addSublayer(shapeLayer)
        
        //Setup visual states for Love button
        isLovedButton.isSelected = fruit.isLoved
        isLovedButton.setTitleColor(UIColor(red: 223/255, green: 76/255, blue: 87/255, alpha: 1), for: .normal)
        isLovedButton.setBackgroundImage(UIImage(systemName: "heart.circle", withConfiguration: .none), for: .normal)
        isLovedButton.setBackgroundImage(UIImage(systemName: "heart.circle.fill", withConfiguration: .none), for: .selected)
    }
    
    func reloadData() {
        iconLabel.text = fruit.icon
        
        nameLabel.text = fruit.name
        
        //Create the stars rate for Quality
        switch fruit.rate {
        case 0:
            qualityLabel.text = "Low Quality"
            starOneImageView.image = UIImage(systemName: "star", withConfiguration: .none)
            starTwoImageView.image = UIImage(systemName: "star", withConfiguration: .none)
            starThreeImageView.image = UIImage(systemName: "star", withConfiguration: .none)
            qualityLabel.text = "Standard Quality"
            starOneImageView.image = UIImage(systemName: "star.fill", withConfiguration: .none)
            starTwoImageView.image = UIImage(systemName: "star", withConfiguration: .none)
            starThreeImageView.image = UIImage(systemName: "star", withConfiguration: .none)
        case 2:
            qualityLabel.text = "High Quality"
            starOneImageView.image = UIImage(systemName: "star.fill", withConfiguration: .none)
            starTwoImageView.image = UIImage(systemName: "star.fill", withConfiguration: .none)
            starThreeImageView.image = UIImage(systemName: "star", withConfiguration: .none)
        default:
            qualityLabel.text = "Best Quality"
            starOneImageView.image = UIImage(systemName: "star.fill", withConfiguration: .none)
            starTwoImageView.image = UIImage(systemName: "star.fill", withConfiguration: .none)
            starThreeImageView.image = UIImage(systemName: "star.fill", withConfiguration: .none)
        }
        
        weighLabel.text = "\(fruit.weigh)g"
        
        weighSlider.setValue(Float(fruit.weigh), animated: false)
        
        originLabel.text = fruit.origin
        
        priceLabel.text = "\(fruit.price)$"
    }
    
    func prepareData(fruit: Fruit) {
        self.fruit = fruit
    }
    
    //State of Love button change when you touch it
    @IBAction func loveTouched(_ sender: Any) {
        isLovedButton.isSelected = !isLovedButton.isSelected
    }
}
