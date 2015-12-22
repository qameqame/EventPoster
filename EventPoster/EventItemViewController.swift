//
//  EventItemViewController.swift
//  EventPoster
//
//  Created by 亀山裕樹 on 2015/12/22.
//  Copyright © 2015年 Hiroki Kameyama. All rights reserved.
//

import UIKit

class EventItemViewController: UIViewController {

    @IBOutlet weak var eventField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancel(sender: UIBarButtonItem) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    
    @IBAction func save(sender: UIBarButtonItem) {
        
        let newEvent: Event = Event.MR_createEntity() as! Event
        newEvent.eventItem = eventField.text!
        newEvent.managedObjectContext!.MR_saveToPersistentStoreAndWait()
        
        navigationController!.popViewControllerAnimated(true)
    }
    
}
