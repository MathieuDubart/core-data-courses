//
//  DataController.swift
//  FetchRequests-using-NSPredicate
//
//  Created by Mathieu Dubart on 03/09/2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name:"DataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
