//
//  SingletonTests.swift
//  SingletonTests
//
//  Created by Bao Doan on 9/19/18.
//  Copyright © 2018 Bao Doan. All rights reserved.
//

import XCTest
@testable import Singleton

class SingletonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
    func testConcurrentAccess(){
        let asyncQueue = DispatchQueue(label: "asyncQueue", attributes: .concurrent, target: nil)
        let expect = expectation(description: "Storing values in SessionState shall succeed")
        //to wait the async method
        let MaxIndex = 200
        for index in 0...MaxIndex{
            asyncQueue.async {
                SessionState.shared.set(index, forKey: String(index))
            }
        }
        while SessionState.shared.object(forKey: String(MaxIndex)) as? Int != MaxIndex{
            
        }
        expect.fulfill() // similar to done() in Javascript QUnit
        waitForExpectations(timeout: 10, handler:  {(error) in
            XCTAssertNil(error, "Test expectation failed")
        })
 
    }
    func testMethod(){
        let result = SimpleMath.add(a: 10, b: 5)
        XCTAssert(result == 15,"Do a right calculation")
    }
    
}
