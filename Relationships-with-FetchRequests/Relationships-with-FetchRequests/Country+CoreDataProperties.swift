//
//  Country+CoreDataProperties.swift
//  Relationships-with-FetchRequests
//
//  Created by Mathieu Dubart on 03/09/2023.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var shortName: String?
    @NSManaged public var candy: NSSet?
    // ----- NSSet = older objective-c data type, equivalent of swift modern sets but we can't use forEach on them

    public var wrappedShortName: String {
        shortName ?? "Unknown Country"
    }
    
    public var wrappedFullName: String {
        fullName ?? "Unknown Country"
    }
    
    // ----- to convert NSSet to array (to make it loopable with forEach):
    public var candyArray: [Candy] {
        let set = candy as? Set<Candy> ?? []
        // ----- as? is a conditionnal typecast which means this NSSet (candy) is actuelly goign to be a set of candy (Set<Candy>)
        // ----- -> try convert NSSet to a set of candy. If it works use that, else use an emtpy array.
        // ----- typecast return nil if it fails, so we use nil coalescing.
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}

extension Country : Identifiable {

}
