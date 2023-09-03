//
//  FilteredList.swift
//  Dynamic-Filtering-FetchRequests
//
//  Created by Mathieu Dubart on 03/09/2023.
//

import CoreData
import SwiftUI

enum FilterType: String {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS[c]"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    // ----- give some content closure that will accept a T and return some content
    // ----- on lui donne en paramètre de notre content closure un T peu importe ce qu'il est (Singer, Employee, Ship...)
    // ----- et son travail est de nous donner en retour le contenu à afficher, et ça doit être un SwiftUI View
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id:\.self) { item in
            // ----- on passe en param de la fonction ('let content: (T) -> Content') l'item qu'on lui donne
            self.content(item)
        }
    }
    // ----- @escaping tells swift we are going to use content later on but not now
    // ----- @ViewBuilder attribute to tell swiftUI we're gonna use VStack, List... and we can provide many views if we want to. We so get tuple view.
    init(filterKey: String, predicate: FilterType = .beginsWith, filterValue: String, sortDescriptors: [SortDescriptor<T>] = [], @ViewBuilder content: @escaping (T) -> Content) {
        // ----- le _ permet de dire qu'on ne lui donne pas de nouveaux résultats à afficher mais qu'on remplace totalement la FetchRequest
        // ----- le %K permet d'insérer des valeurs mais sans les '' autour (à la différence de %@)
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}
