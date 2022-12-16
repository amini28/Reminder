//
//  Tasks+CoreDataProperties.swift
//  SchedulerApp
//
//  Created by Amini on 29/07/22.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var title: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var isAlertOn: Bool
    @NSManaged public var alertTime: String?
    @NSManaged public var repetition: Bool
    @NSManaged public var taskDate: Date?

}

extension Tasks : Identifiable {

}
