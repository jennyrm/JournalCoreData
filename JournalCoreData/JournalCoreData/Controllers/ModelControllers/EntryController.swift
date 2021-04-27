//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Jenny Morales on 4/26/21.
//

import CoreData

class EntryController {
    //MARK: - Properties
    static let shared = EntryController()
    
    var entries = [Entry]()
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {}
    
    //MARK: - CRUD
    func createEntry(title: String, bodyText: String) {
        let newEntry = Entry(title: title, bodyText: bodyText)
        entries.append(newEntry)

        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(entries.count)
        self.entries = entries
    }
    
    func updateEntry(_ entry: Entry) {
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(entry: Entry) {
        if let index = entries.firstIndex(where: { $0 == entry }) {
            entries.remove(at: index)
        }
        
        CoreDataStack.context.delete(entry)
        CoreDataStack.saveContext()
    }
}//End of class
