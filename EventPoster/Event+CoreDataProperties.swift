//
//  Event+CoreDataProperties.swift
//  
//
//  Created by 亀山裕樹 on 2015/12/22.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Event {

    @NSManaged var eventItem: String?
    @NSManaged var eventDesc: String?

}
