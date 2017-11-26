//
//  Note+CoreDataProperties.swift
//  NotesApp
//
//  Created by Jake Woratzeck on 11/26/17.
//  Copyright © 2017 Jake Woratzeck. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var body: String?
    @NSManaged public var title: String?

}
