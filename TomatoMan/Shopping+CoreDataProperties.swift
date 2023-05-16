//
//  Shopping+CoreDataProperties.swift
//  
//
//  Created by Apple on 16/05/23.
//
//

import Foundation
import CoreData


extension Shopping {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Shopping> {
        return NSFetchRequest<Shopping>(entityName: "Shopping")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var price: Float
    @NSManaged public var quantity: Float
    @NSManaged public var total: Float

}
