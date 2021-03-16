//
//  CommonModels.swift
//  W1-Project1-Gumi
//
//  Created by Thành Nguyên on 16/03/2021.
//

import UIKit

struct Fruit {
    var icon = ""
    var name = ""
    var rate = 0
    var weigh = 0
    var origin = ""
    var price = 0
    var isLoved = false
    var backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    
    init(icon: String, name: String, rate: Int, weigh: Int, origin: String, price: Int, isLoved: Bool, color: UIColor) {
        self.icon = icon
        self.name = name
        self.rate = rate
        self.weigh = weigh
        self.origin = origin
        self.price = price
        self.isLoved = isLoved
        self.backgroundColor = color
    }
    
    init(){}
}
