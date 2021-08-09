//
//  DDEvent+Helper.swift
//  Digitat14DemoTests
//
//  Created by Dattatray Deokar on 09/08/21.
//

import Foundation
@testable import Digitat14Demo


func aEvent(id: Int = Int.random(in: 1..<100), title: String = "any title", displayLocation: String = "any location", timeStamp:String = "", imageUrl:String, isFavourite:Bool) -> DDEvent {
    let event = DDEvent()
    event.id = id
    event.title = title
    event.venue = DDVenue()
    event.venue?.displayLocation = displayLocation
    event.datetimeLocal = timeStamp
    let performer = DDPerformer()
    performer.image = imageUrl
    event.performers = [performer]
    event.isFavorite = isFavourite
   return event
}
