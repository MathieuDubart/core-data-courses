//
//  ContentView.swift
//  Dynamic-Filtering-FetchRequests
//
//  Created by Mathieu Dubart on 03/09/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            // ----- le T dans FilteredListView devient de type Singer grâce au (singer: Singer)
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add examples"){
                let taylor = Singer(context:moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context:moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context:moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Button("Show A"){
                lastNameFilter = "A"
            }
            
            Button("Show S"){
                lastNameFilter = "S"
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
 
