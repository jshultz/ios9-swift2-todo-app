//
//  SecondViewController.swift
//  todo-app
//
//  Created by Jason Shultz on 10/1/15.
//  Copyright © 2015 HashRocket. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.item.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var item: UITextField!
    
    
    @IBAction func addItem(sender: AnyObject) {
        toDoList.append(item.text!)
        item.text = ""
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        item.resignFirstResponder()
        return true
    }


}

