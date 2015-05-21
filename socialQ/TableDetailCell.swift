//
//  TableDetailCell.swift
//  socialQ
//
//  Created by Calvin Zheng on 2015-05-21.
//  Copyright (c) 2015 JakeS. All rights reserved.
//

import UIKit

class TableDetailCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var tableView: UITableView!

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        
        self.tableView.registerNib(UINib(nibName: "DetailEntryCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "DetailEntryCell")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 7
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if let aCell = tableView.dequeueReusableCellWithIdentifier("DetailEntryCell", forIndexPath: indexPath) as? DetailEntryCell
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
        return 60
    }
}
