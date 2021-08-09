//
//  DDListItemViewModel.swift
//  Digitat14Demo
//
//  Created by Dattatray Deokar on 09/08/21.
//

import Foundation

struct DDListItem:Equatable {
    var id:Int
    var title:String
    var timestamp:String
    var location:String
    var imageUrl:String
    var isFavourite:Bool
}
