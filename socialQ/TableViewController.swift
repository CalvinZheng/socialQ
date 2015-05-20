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
    
    func prepareForDisplay()
    {
        self.tableView?.registerNib(UINib(nibName: "TableContentCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "mainContentCell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
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
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 100
    }
}
