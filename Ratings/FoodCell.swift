
//
//  Food.swift
//  storyBoardLab
//
//  Created by Rui-hao O Qiu on 4/13/16.
//  Copyright (c) 2016 Rui-hao O Qiu. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {
  
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ratingImageView: UIImageView!
  
  var food: Food! {
    didSet {
      priceLabel.text = food.price
      nameLabel.text = food.name
      ratingImageView.image = imageForRating(food.rating)
    }
  }
  
  func imageForRating(rating:Int) -> UIImage? {
    let imageName = "\(rating)Stars"
    return UIImage(named: imageName)
  }
  
  
}
