//
//  WorkAddress.swift
//  Prototype
//
//  Created by Bao Doan on 9/23/18.
//  Copyright © 2018 Bao Doan. All rights reserved.
//

import UIKit

public class WorkAddress: CustomStringConvertible, NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        return WorkAddress(streetAddress: self.streetAddress, city: self.city, zip: self.zip)
    }
    
    public var streetAddress: String
    public var city: String
    public var zip: String
    public init(streetAddress: String, city: String, zip: String){
        self.streetAddress = streetAddress
        self.city = city
        self.zip = zip
    }
    public var description: String {
        return "\(streetAddress) \(city) \(zip)"
    }
}
