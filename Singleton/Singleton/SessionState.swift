//
//  SessionState.swift
//  Singleton
//
//  Created by Bao Doan on 9/19/18.
//  Copyright © 2018 Bao Doan. All rights reserved.
//

import UIKit
import Foundation
public class SessionState {
    
    private var storage = [String: Any]()
    
   // private let syncQueue = DispatchQueue(label: "serializationQueue")
    private let asyncQueue = DispatchQueue(label: "asyncQueue", attributes: .concurrent, target: nil)
    
    private init(){}
    
    public static let shared: SessionState = {
        let instance = SessionState()
        return instance
    }()
    
    public func set<T>(_ value: T?, forKey key: String){
        asyncQueue.async(flags: .barrier) {
            self.storage[key] = value
        }
    }
    
    public func object<T>(forKey key: String) -> T?{
        var result: T?
        asyncQueue.sync(flags: .barrier)  {
            result = self.storage[key] as? T ?? nil
        }
        return result
    }
}
