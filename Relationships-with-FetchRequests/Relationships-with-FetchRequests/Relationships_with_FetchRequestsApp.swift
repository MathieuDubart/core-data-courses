//
//  Relationships_with_FetchRequestsApp.swift
//  Relationships-with-FetchRequests
//
//  Created by Mathieu Dubart on 03/09/2023.
//

import SwiftUI

@main
struct Relationships_with_FetchRequestsApp: App {
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
