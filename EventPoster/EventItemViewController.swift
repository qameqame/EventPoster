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
    @IBOutlet weak var eventTextView: UITextView!
    
    var event: Event? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let eventPost = event{
            eventField.text = eventPost.eventItem
            eventTextView.text = eventPost.eventDesc
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancel(sender: UIBarButtonItem) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    
    @IBAction func save(sender: UIBarButtonItem) {
        if event != nil{
            editEvent()
        }else{
          createEvent()
        }
        
        navigationController!.popViewControllerAnimated(true)
    }
    
    func createEvent(){
        let newEvent:Event = Event.MR_createEntity() as! Event
        newEvent.eventItem = eventField.text
        newEvent.eventDesc = eventTextView.text
        newEvent.managedObjectContext!.MR_saveToPersistentStoreAndWait()
    }
    
    func editEvent(){
        event?.eventItem = eventField.text
        event?.eventDesc = eventTextView.text
        event?.managedObjectContext!.MR_saveToPersistentStoreAndWait()
    }
    
    
}
