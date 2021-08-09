//
//  SeatGeekAPI+TestHelpers.swift
//  Digitat14DemoTests
//
//  Created by Dattatray Deokar on 09/08/21.
//

import Foundation
@testable import Digitat14Demo


extension DDSeatGeekAPI {
    
    static var never: DDSeatGeekAPI {
        DDSeatGeekAPI.results([])
    }

    static func once(_ events: [DDEvent]) -> DDSeatGeekAPI {
        DDSeatGeekAPI.results([.success(events)])
    }

    static func results(_ results: [Result<[DDEvent], Error>]) -> DDSeatGeekAPI {
        var results = results
        return DDSeatGeekAPI.resultBuilder { results.removeFirst() }
    }

    static func resultBuilder(_ resultBuilder: @escaping () -> Result<[DDEvent], Error>) -> DDSeatGeekAPI {
        DDSeatGeekAPIStub(resultBuilder: resultBuilder)
    }

    private class DDSeatGeekAPIStub: DDSeatGeekAPI {
        private let nextResult: () -> Result<[DDEvent], Error>
        
        init(resultBuilder: @escaping () -> Result<[DDEvent], Error>) {
            self.nextResult = resultBuilder
        }
        
        override func loadEvents(completion: @escaping (Result<[DDEvent], Error>) -> Void) {
            completion(self.nextResult())
        }
    }
}



