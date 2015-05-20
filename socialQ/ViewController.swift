//
//  ViewController.swift
//  socialQ
//
//  Created by Calvin Zheng on 2015-05-20.
//  Copyright (c) 2015 JakeS. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var tableView: UITableView!
    
    lazy var tableViewController: TableViewController =
    {
        var cv = TableViewController()
        return cv
    }()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableViewController.tableView = self.tableView
        self.tableViewController.prepareForDisplay()
        self.tableView.delegate = self.tableViewController
        self.tableView.dataSource = self.tableViewController
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

