//
//  FetchRequests_using_NSPredicateApp.swift
//  FetchRequests-using-NSPredicate
//
//  Created by Mathieu Dubart on 03/09/2023.
//

import SwiftUI

@main
struct FetchRequests_using_NSPredicateApp: App {
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
