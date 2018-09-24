//
//  PrototypeTests.swift
//  PrototypeTests
//
//  Created by Bao Doan on 9/23/18.
//  Copyright © 2018 Bao Doan. All rights reserved.
//

import XCTest
@testable import Prototype

class PrototypeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testContact(){
       /* var contactProtype = Contact(firstName: "Joe", lastName: "Black")
        var anothercontact = contactProtype
        print(MemoryUtil.address(contactProtype))
        print(MemoryUtil.address(anothercontact))
        anothercontact.firstName = "Ford"
        anothercontact.lastName = "Perfect"
        print(contactProtype)
        print(anothercontact)
        var cloneContact = contactProtype.copy() as! Contact
        cloneContact.firstName = "Joe"
        cloneContact.lastName = "Black"
        
        print(contactProtype)
        print(cloneContact)
        
        print(MemoryUtil.address(contactProtype))
        print(MemoryUtil.address(cloneContact))*/
    }
    func testShallowCopy(){
        var contactPrototype = Contact(firstName: "Joe", lastName: "Black", workAddress:WorkAddress(streetAddress: "1 Dong Van Cong", city: "Sai Gon", zip: "1332"))
        var contactCopy = contactPrototype.copy() as! Contact
        contactCopy.workAddress.city = "Da Nang"
        print(contactPrototype.workAddress)
        print(contactCopy.workAddress)
        print(MemoryUtil.address(contactPrototype.workAddress))
        print(MemoryUtil.address(contactCopy.workAddress))
    }

}
