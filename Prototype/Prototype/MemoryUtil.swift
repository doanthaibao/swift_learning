//
//  MemoryUtil.swift
//  Prototype
//
//  Created by Bao Doan on 9/23/18.
//  Copyright © 2018 Bao Doan. All rights reserved.
//

import UIKit

public class MemoryUtil {

    public static func address(_ o: UnsafeRawPointer) -> String{
        let address = Int(bitPattern: o)
        return String(format: "%p", address)
    }
    public static func address<T: AnyObject>(_ ref: T) ->String {
        let address = unsafeBitCast(ref, to: Int.self)
        return String(format: "%p", address)
    }
}
