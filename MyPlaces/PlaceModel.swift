//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Pavel Tsyganov on 21.12.2021.
//

import UIKit

struct Place {
    var name: String
    var location: String?
    var type: String?
    var image: UIImage?
    var restaurantImage: String?
    
    static let restaurantNames = [
        "MacDonalds", "Самурай", "Фантастика", "Мега", "Океанис"
    ]
    
    static func getPlaces() -> [Place] {
        var places = [Place]()
        
        for place in restaurantNames {
            places.append(Place(name: place, location: "Нижний Новгород", type: "Ресторан", image: nil, restaurantImage: place))
        }
        return places
    }
}