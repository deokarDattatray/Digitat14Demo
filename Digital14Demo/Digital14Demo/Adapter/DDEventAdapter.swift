//
//  DDEventAdapter.swift
//  Digitat14Demo
//
//  Created by Dattatray Deokar on 09/08/21.
//

import Foundation

struct DDEventAdapter: DDListItemsLoadService {
    let api:DDSeatGeekAPI
    func loadItems(completion: @escaping (Result<[DDListItem], Error>) -> Void) {
        self.api.loadEvents { result in
            switch result {
            case .success(let events):
                let items = events.map({DDListItem(id: $0.id ?? 0, title: $0.title ?? "", timestamp: $0.datetimeLocal ?? "", location: $0.venue?.displayLocation ?? "", imageUrl: $0.performers?.first?.image ?? "", isFavourite: false)})
                completion(.success(items))
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
}
