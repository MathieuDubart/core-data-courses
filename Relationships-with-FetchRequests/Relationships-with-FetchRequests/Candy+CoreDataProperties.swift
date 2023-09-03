//
//  Candy+CoreDataProperties.swift
//  Relationships-with-FetchRequests
//
//  Created by Mathieu Dubart on 03/09/2023.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown"
    }
}

extension Candy : Identifiable {

}
