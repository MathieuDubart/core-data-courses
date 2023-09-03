//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Mathieu Dubart on 03/09/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        VStack {
            Button("Save") {
                // ----- Apple specifically states that we should always check for uncommitted changes before calling save(),
                // ----- to avoid making Core Data do work that isn’t required.
                if moc.hasChanges {
                    try? moc.save()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
