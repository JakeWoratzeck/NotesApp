//
//  Note+CoreDataClass.swift
//  NotesApp
//
//  Created by Jake Woratzeck on 11/26/17.
//  Copyright © 2017 Jake Woratzeck. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Note)
public class Note: NSManagedObject {

    convenience init?(title: String?, body: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Note.entity(), insertInto: managedContext)
        
        self.title = title
        self.body = body
    }
}
