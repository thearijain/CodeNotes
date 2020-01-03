//
//  Notebooks+CoreDataProperties.swift
//  CodeNotes2.0
//
//  Created by Ari Jain on 1/2/20.
//  Copyright © 2020 Arihant Jain. All rights reserved.
//
//

import Foundation
import CoreData

//is overriden often

extension Notebooks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notebooks> {
        return NSFetchRequest<Notebooks>(entityName: "Notebooks")
    }

    @NSManaged public var notebookName: String?

}
