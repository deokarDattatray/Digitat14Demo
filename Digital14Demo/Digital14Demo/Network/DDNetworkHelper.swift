//
//  DDNetworkHelper.swift
//  Digitat14Demo
//
//  Created by Dattatray Deokar on 09/08/21.
//

import UIKit
import Alamofire


class DDNetworkHelper: NSObject {


    static let shared = DDNetworkHelper ()
    var headers = AF.session
    private override init() {
        super.init()
    }
    
    class func getHeader(url: String,isMautipartFormData:Bool = false) -> HTTPHeaders? {
        var headers: HTTPHeaders?
        headers = [
            "Content-Type":"application/json"
        ]
        return headers
    }
}
