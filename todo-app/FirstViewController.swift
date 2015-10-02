//
//  FirstViewController.swift
//  todo-app
//
//  Created by Jason Shultz on 10/1/15.
//  Copyright © 2015 HashRocket. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let userDefaults = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") {
            
            toDoList = userDefaults as! [String]
            
        }
    }
    
    @IBOutlet weak var toDoListTable: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return toDoList.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            toDoListTable.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }

    


}

