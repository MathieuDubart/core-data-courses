//
//  DataController.swift
//  CoreDataConstraints
//
//  Created by Mathieu Dubart on 03/09/2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataConstraints")
    
    init() {
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                // ----- if we faile to load, then bail out
                return
            }
            // ----- but if it loads correctly
            // ----- we merge identical objects based on their properties, by merging the news and the olds properties together.
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
