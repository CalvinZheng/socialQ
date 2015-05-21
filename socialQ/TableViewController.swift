//
//  TableViewController.swift
//  socialQ
//
//  Created by Calvin Zheng on 2015-05-20.
//  Copyright (c) 2015 JakeS. All rights reserved.
//

import UIKit

class TableViewController: NSObject, UITableViewDataSource, UITableViewDelegate
{
    var tableView: UITableView?
    var expandedRow: Int?
    
    func prepareForDisplay()
    {
        self.tableView?.registerNib(UINib(nibName: "TableContentCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "mainContentCell")
        self.tableView?.registerNib(UINib(nibName: "TableDetailCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "detailCell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if expandedRow == nil
        {
            return 10
        }
        else
        {
            return 11
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.row-1 == self.expandedRow
        {
            if let aCell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as? TableDetailCell
            {
                return aCell
            }
            else
            {
                assertionFailure("NoDetailCellFound")
                return UITableViewCell()
            }
        }
        else
        {
            if let aCell = tableView.dequeueReusableCellWithIdentifier("mainContentCell", forIndexPath: indexPath) as? TableContentCell
            {
                return aCell
            }
            else
            {
                assertionFailure("NoDetailCellFound")
                return UITableViewCell()
            }
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if indexPath.row-1 == self.expandedRow
        {
            return tableView.height-80
        }
        else
        {
            return 80
        }
    }
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        if indexPath.row-1 == self.expandedRow
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if self.expandedRow != nil
        {
            self.expandedRow = nil
            tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: indexPath.row+1, inSection: indexPath.section)], withRowAnimation: UITableViewRowAnimation.Top)
        }
        else
        {
            self.expandedRow = indexPath.row
            var newIndex = NSIndexPath(forRow: indexPath.row+1, inSection: indexPath.section)
            tableView.insertRowsAtIndexPaths([newIndex], withRowAnimation: UITableViewRowAnimation.Top)
            tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: true)
            tableView.cellForRowAtIndexPath(newIndex)?.superview?.sendSubviewToBack(tableView.cellForRowAtIndexPath(newIndex)!)
        }
    }
}
