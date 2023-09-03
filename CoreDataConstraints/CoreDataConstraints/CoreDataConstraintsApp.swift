//
//  CoreDataConstraintsApp.swift
//  CoreDataConstraints
//
//  Created by Mathieu Dubart on 03/09/2023.
//

import SwiftUI

@main
struct CoreDataConstraintsApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
