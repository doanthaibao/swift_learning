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
    
    private let syncQueue = DispatchQueue(label: "serializationQueue")
    
    private init(){}
    
    public static let shared: SessionState = {
        let instance = SessionState()
        return instance
    }()
    
    public func set(_ value: Any, forKey key: String){
        syncQueue.sync {
            storage[key] = value
        }
    }
    
    public func object(forKey key: String) -> Any?{
        var result: Any?
        syncQueue.sync {
            result = storage[key] ?? nil
        }
        return result
    }
}
