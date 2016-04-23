
//
//  Food.swift
//  storyBoardLab
//
//  Created by Rui-hao O Qiu on 4/13/16.
//  Copyright (c) 2016 Rui-hao O Qiu. All rights reserved.
//

import UIKit

class PricePickerViewController: UITableViewController {
  
  var prices:[String] = [
    "Very Cheap",
    "Cheap",
    "Moderate",
    "Fancy",
    "Expensive",
    "Very Expensive"]
  
  var selectedPrice:String? {
    didSet {
      if let price = selectedPrice {
        selectedPriceIndex = prices.indexOf(price)!
      }
    }
  }
  var selectedPriceIndex:Int?
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return prices.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PriceCell", forIndexPath: indexPath)
    cell.textLabel?.text = prices[indexPath.row]
    
    if indexPath.row == selectedPriceIndex {
      cell.accessoryType = .Checkmark
    } else {
      cell.accessoryType = .None
    }
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    //Other row is selected - need to deselect it
    if let index = selectedPriceIndex {
      let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
      cell?.accessoryType = .None
    }
    
    selectedPrice = prices[indexPath.row]
    
    //update the checkmark for the current row
    let cell = tableView.cellForRowAtIndexPath(indexPath)
    cell?.accessoryType = .Checkmark
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SaveSelectedPrice" {
      if let cell = sender as? UITableViewCell {
        let indexPath = tableView.indexPathForCell(cell)
        if let index = indexPath?.row {
          selectedPrice = prices[index]
        }
      }
    }
  }
}
