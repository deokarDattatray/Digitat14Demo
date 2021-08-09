//
//  SceneBuilder.swift
//  Digitat14DemoTests
//
//  Created by Dattatray Deokar on 09/08/21.
//

import UIKit
@testable import Digitat14Demo

struct SceneBuilder {
    static func reset() {
        DDSeatGeekAPI.shared = DDSeatGeekAPI()
    }
    
    func build(seatGeekAPI: DDSeatGeekAPI = .once([])) throws -> UINavigationController {
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DDNavigationController") as! UINavigationController
        SceneDelegate.main.config()
        return nav
    }
}

private extension SceneDelegate {
    static var main: SceneDelegate {
        (UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate)
    }
}
