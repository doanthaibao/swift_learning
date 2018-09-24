//
//  Contact.swift
//  Prototype
//
//  Created by Bao Doan on 9/23/18.
//  Copyright © 2018 Bao Doan. All rights reserved.
//

import UIKit

public class Contact: NSCopying, CustomStringConvertible{
    public func copy(with zone: NSZone? = nil) -> Any {
        return Contact(firstName: self.firstName, lastName: self.lastName, workAddress: self.workAddress.copy() as! WorkAddress)
    } 
    public var firstName: String
    public var lastName: String
    public var workAddress: WorkAddress
    public init(firstName: String, lastName: String, workAddress: WorkAddress){
        self.firstName = firstName
        self.lastName = lastName
        self.workAddress = workAddress
    }
    public var description: String {
        return "\(firstName), \(lastName)"
    }
}
extension Contact: Equatable{
    public static func == (lhs: Contact, rhs: Contact) -> Bool{
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
}
