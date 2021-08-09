//
//  SeatGeekAPI.swift
//  Digitat14Demo
//
//  Created by Dattatray Deokar on 09/08/21.
//

import UIKit
import Alamofire

enum SeatGeekEndPoints:String {
    case events = "/events"
    
}

struct DDEventsParameters: Codable {
    var client_id:String
    var client_secret:String
}

typealias DDHTTPServiceCompletionHandler = (Error?, _ data:Data?) -> Void


class DDSeatGeekAPI: NSObject {
    
    private static let clientId = "MjI4MzMxNTd8MTYyODQyMTI5Ny40NzA3NDE3"
    private static let secret = "fec1dcdbffd558c9d836dfd6c48be7fb8eb423c15ab2fb8882c0d55b2dc3e9b0"
    private static let hostURL = "https://api.seatgeek.com/2"
    
    static var shared = DDSeatGeekAPI()
    
    private struct NoEventsFound: Error {}
    
    func loadEvents(completion: @escaping (Result<[DDEvent], Error>) -> Void){
        let parameters = DDEventsParameters(client_id: DDSeatGeekAPI.clientId, client_secret: DDSeatGeekAPI.secret)
        self.sendGETEventsRequest(url: SeatGeekEndPoints.events.rawValue, parameters: parameters) { error, data in
            DispatchQueue.mainAsyncIfNeeded {
                if let data = data{
                    do{
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.dataDecodingStrategy = .deferredToData
                        let response = try jsonDecoder.decode(DDSeatGeekResponse.self, from: data)
                        completion(.success(response.events ?? []))
                    } catch let error  {
                        print(error)
                        completion(.failure(error))
                    }
                }else if let error = error{
                    completion(.failure(error))
                }else{
                    completion(.failure(NoEventsFound()))
                }
            }
        }
    }
    
    @discardableResult
    private func sendGETEventsRequest(url: String, parameters: DDEventsParameters? = nil, onCompletion:@escaping DDHTTPServiceCompletionHandler) -> DataRequest? {
        let headers: HTTPHeaders = [
            "Content-Type":"application/json"
        ]
        let urlString = "\(DDSeatGeekAPI.hostURL)\(url)"
        return AF.request(urlString, method: .get, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default,headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    onCompletion(nil, data)
                    return
                }
                onCompletion(nil, nil)
            case .failure(let error):
                onCompletion(error, nil)
            }
        }
    }
}
