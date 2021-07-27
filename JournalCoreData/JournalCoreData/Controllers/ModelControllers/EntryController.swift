//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Nevan Bingham on 7/26/21.
//

import CoreData

class EntryController {
    
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()

    func createEntry(title: String, bodyText: String, timeStamp: Date) {
        let entry = Entry(title: title, bodyText: bodyText, timeStamp: timeStamp)
        entries.append(entry)
        
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        print(entries.count)
        self.entries = entries
    }
    
    func updateEntry(_ entry: Entry, title: String, bodyText: String, timeStamp: Date) {
        entry.title = title
        entry.bodyText = bodyText
        entry.timeStamp = timeStamp
        
        CoreDataStack.saveContext()
    }






}
