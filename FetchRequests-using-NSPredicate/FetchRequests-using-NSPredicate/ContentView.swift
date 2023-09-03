//
//  ContentView.swift
//  FetchRequests-using-NSPredicate
//
//  Created by Mathieu Dubart on 03/09/2023.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    // ----- NSPredicate applique des tests à effectuer sur les résultats des FetchRequests.
    // ----- Seuls les objets qui réussissent le test seront inclus dans les resultats finaux.
    // ----- predicate: NSPredicate(format: "universe == 'Star Wars'") ne montre que les vaisseaux dont l'univers est Star Wars
    // ----- Pour passer des Strings en paramètre de manière plus simple, on peut aussi écrire:
    // ----- predicate: NSPredicate(format: "universe == %@", "Star Wars")
    // ----- NSPredicate(format: "name < %@", "F") affiche les vaisseaux dont la 1ere lettre du nom se trouve avant la lettre F dans l'alphabet
    // ----- NSPredicate(format: "universe IN  %@", ["Aliens", "Firefly", "Star Trek"] affiche les vaisseaux qui trouvent dans au moins l'un des univers du tableau
    // ----- NSPredicate(format: "name BEGINSWITH  %@", "E") montre les vaisseaux dont le nom commence par E (case sensitive)
    // ----- NSPredicate(format: "name BEGINSWITH[c]  %@", "e") montre les vaisseaux dont le nom commence par E ou e (case insensitive)
    // ----- NSPredicate(format: "name CONTAINS[c]  %@", "e") montre les vaisseaux dont le nom contient E ou e (case insensitive)
    // ----- NSPredicate(format: "NOT name BEGINSWITH[c]  %@", "e") montre les vaisseaux dont le nom NE COMMENCE PAS par E ou e (case insensitive)
    
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH  %@", "E")) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add examples") {
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? moc.save()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
