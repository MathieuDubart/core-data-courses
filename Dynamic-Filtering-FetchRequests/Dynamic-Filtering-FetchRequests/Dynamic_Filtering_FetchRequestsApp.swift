//
//  Dynamic_Filtering_FetchRequestsApp.swift
//  Dynamic-Filtering-FetchRequests
//
//  Created by Mathieu Dubart on 03/09/2023.
//

import SwiftUI

@main
struct Dynamic_Filtering_FetchRequestsApp: App {
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
