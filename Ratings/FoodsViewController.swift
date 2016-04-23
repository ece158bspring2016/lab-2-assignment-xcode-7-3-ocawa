
//
//  Food.swift
//  storyBoardLab
//
//  Created by Rui-hao O Qiu on 4/13/16.
//  Copyright (c) 2016 Rui-hao O Qiu. All rights reserved.
//

import UIKit

class FoodsViewController: UITableViewController {
  
  var foods:[Food] = foodsData
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return foods.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
    -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("FoodCell", forIndexPath: indexPath)
        as! FoodCell
      
      let food = foods[indexPath.row] as Food
      cell.food = food
      return cell
  }
  
  // Mark Unwind Segues
  @IBAction func cancelToFoodsViewController(segue:UIStoryboardSegue) {
  }
  
  @IBAction func saveFoodDetail(segue:UIStoryboardSegue) {
    if let foodDetailsViewController = segue.sourceViewController as? FoodDetailsViewController {
      
      //add the new food to the foods array
      if let food = foodDetailsViewController.food {
        foods.append(food)
        
        //update the tableView
        let indexPath = NSIndexPath(forRow: foods.count-1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
      }
    }
  }
}
