//
//  DispatchQueueAdditions.swift
//  Digitat14Demo
//
//  Created by Dattatray Deokar on 09/08/21.
//

import Foundation
extension DispatchQueue {
    static func mainAsyncIfNeeded(execute work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            main.async(execute: work)
        }
    }
}
