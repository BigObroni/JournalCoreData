//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Nevan Bingham on 7/26/21.
//

import CoreData

extension Entry {
    
    @discardableResult
    convenience init(title: String, bodyText: String, timeStamp: Date, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = timeStamp
    }
}//End of extension
