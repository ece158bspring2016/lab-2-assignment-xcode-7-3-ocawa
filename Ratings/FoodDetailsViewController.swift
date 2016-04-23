
//
//  Food.swift
//  storyBoardLab
//
//  Created by Rui-hao O Qiu on 4/13/16.
//  Copyright (c) 2016 Rui-hao O Qiu. All rights reserved.
//

import UIKit

class FoodDetailsViewController: UITableViewController {
  
  var food:Food?
  
  var price:String = "Very Cheap" {
    didSet {
      detailLabel.text? = price
    }
  }
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var detailLabel: UILabel!
  
  required init?(coder aDecoder: NSCoder) {
    print("init FoodDetailsViewController")
    super.init(coder: aDecoder)
  }
  
  deinit {
    print("deinit FoodDetailsViewController")
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if indexPath.section == 0 {
      nameTextField.becomeFirstResponder()
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SaveFoodDetail" {
      food = Food(name: nameTextField.text, price:price, rating: 1)
    }
    if segue.identifier == "PickPrice" {
      if let pricePickerViewController = segue.destinationViewController as? PricePickerViewController {
        pricePickerViewController.selectedPrice = price
      }
    }
  }
  
  //Unwind segue
  @IBAction func unwindWithSelectedPrice(segue:UIStoryboardSegue) {
    if let pricePickerViewController = segue.sourceViewController as? PricePickerViewController,
      selectedPrice = pricePickerViewController.selectedPrice {
        price = selectedPrice
    }
  }
  
}
