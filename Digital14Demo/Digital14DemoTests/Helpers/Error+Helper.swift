//
//  Error+Helper.swift
//  Digitat14DemoTests
//
//  Created by Dattatray Deokar on 09/08/21.
//

import Foundation
func anError() -> Error {
    NSError(localizedDescription: "any error message")
}

extension NSError {
    convenience init(localizedDescription: String) {
        self.init(domain: "Test", code: 0, userInfo: [NSLocalizedDescriptionKey: localizedDescription])
    }
}
