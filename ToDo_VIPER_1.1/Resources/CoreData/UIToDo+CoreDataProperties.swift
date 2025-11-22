//
//  UIToDo+CoreDataProperties.swift
//  ToDo_VIPER_1.1
//
//  Created by Igor Polousov on 22.11.2025.
//
//

public import Foundation
public import CoreData


public typealias UIToDoCoreDataPropertiesSet = NSSet

extension UIToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UIToDo> {
        return NSFetchRequest<UIToDo>(entityName: "UIToDo")
    }

    @NSManaged public var id: Int64
    @NSManaged public var todo: String?
    @NSManaged public var notes: String?
    @NSManaged public var completed: Bool
    @NSManaged public var userId: Int64
    @NSManaged public var time: Date?

}
