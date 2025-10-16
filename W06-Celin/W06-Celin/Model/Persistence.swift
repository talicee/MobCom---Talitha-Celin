//
//  Persistence.swift
//  W06-Celin
//
//  Created by student on 16/10/25.
//


import CoreData
//ngurusin stacknya core data mu, persistence

struct PersistenceController{
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "StudentModel")
        
        if inMemory{
            container.persistentStoreDescriptions.first!.url =
            URL(fileURLWithPath: "dev/null")
        }
        
        container.loadPersistentStores{ _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        container.viewContext.mergePolicy =
        NSMergeByPropertyStoreTrumpMergePolicy
    }
    
}
