//
//  ViewController.swift
//  EventPoster
//
//  Created by 亀山裕樹 on 2015/12/22.
//  Copyright © 2015年 Hiroki Kameyama. All rights reserved.
//

//test

import UIKit

class EventPosterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var eventEntities:[Event]!

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        eventEntities = Event.MR_findAll() as? [Event]
        tableView.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventEntities = Event.MR_findAll() as? [Event]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventEntities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventListItem")! as UITableViewCell
        cell.textLabel!.text = eventEntities[indexPath.row].eventItem
        return cell
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            eventEntities.removeAtIndex(indexPath.row).MR_deleteEntity()
            NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
            tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "edit"{
            let epController = segue.destinationViewController as! EventItemViewController
            let event = eventEntities[tableView.indexPathForSelectedRow!.row]
            
            epController.event = event
            
        }
    }
    
    
}

