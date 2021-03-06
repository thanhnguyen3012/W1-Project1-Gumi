//
//  HomeViewController.swift
//  W1-Project1-Gumi
//
//  Created by ThΓ nh NguyΓͺn on 16/03/2021.
//

import UIKit


class HomeViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var cartView: [UIView]!
    
    //Data
    let listOfFruits = [
                        Fruit(icon: "π", name: "Lemon", rate: 3, weigh: 400, origin: "πΊπΈ from USA", price: 1, isLoved: false, color: UIColor(red: 255/255, green: 211/255, blue: 52/255, alpha: 1)),
                        Fruit(icon: "π", name: "Orange", rate: 2, weigh: 800, origin: "π¨π¦ from Canada", price: 2, isLoved: true, color: UIColor(red: 212/255, green: 175/255, blue: 64/255, alpha: 1)),
                        Fruit(icon: "π", name: "Strawberry", rate: 3, weigh: 750, origin: "πͺπΈ from Spain", price: 10, isLoved: false, color: UIColor(red: 238/255, green: 68/255, blue: 86/255, alpha: 1)),
                        Fruit(icon: "π", name: "Grapes", rate: 2, weigh: 900, origin: "π«π· from France", price: 14, isLoved: true, color: UIColor(red: 160/255, green: 56/255, blue: 105/255, alpha: 1))]

    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionView()
        configUI()
    }
    
    func configUI() {
        //Set clear color for the navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        for view in cartView {
            view.clipsToBounds = true
            view.layer.cornerRadius = view.frame.height/2
            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        }
    }
    
    private func initCollectionView() {
        collectionView.register(HomeCell.nib, forCellWithReuseIdentifier: HomeCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfFruits.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        cell.bindData(fruit: listOfFruits[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.prepareData(fruit: listOfFruits[indexPath.row])

        self.navigationController?.pushViewController(vc, animated: true)
    }
}
