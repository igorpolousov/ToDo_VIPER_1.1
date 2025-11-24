//
//  CoreDataStack.swift
//  ToDo_VIPER_1.1
//
//  Created by Igor Polousov on 22.11.2025.
//

import Foundation
import CoreData

class CoreDataStack {
    // Model name
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    // Container
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("\(String(describing: ErrorHandler.unableToLoadPersistantStores.errorDescription)) \(error.userInfo)")
            }
        }
        return container
    }()
    
    // Context
    lazy var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    
    // Context changes save impl.
    func saveContext() {
        guard managedContext.hasChanges else { return }
        managedContext.automaticallyMergesChangesFromParent = true
        let backgroundContext = storeContainer.newBackgroundContext()
        
        backgroundContext.perform {
            do {
                try backgroundContext.save()
            } catch let error as NSError {
                fatalError("\(String(describing: ErrorHandler.unableToSaveContextChanges.errorDescription)): \(error.userInfo)")
            }
            
        }
//        do {
//            try managedContext.save()
//        }  catch let error as NSError {
//            print("Unable to save context: \(error.localizedDescription)")
//        }
    }
    
}
