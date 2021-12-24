//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Pavel Tsyganov on 21.12.2021.
//

import RealmSwift

class Place: Object {
    @Persisted var name = ""
    @Persisted var location: String?
    @Persisted var type: String?
    @Persisted var imageData: Data?

    
    let restaurantNames = [
        "MacDonalds", "Самурай", "Фантастика", "Мега", "Океанис"
    ]
    
    func savePlaces() {
        
        for place in restaurantNames {
            let newPlace  = Place()
            let image = UIImage(named: place)
            guard let imageData = image?.pngData() else { return }
            
            newPlace.name = place
            newPlace.location = "Ufa"
            newPlace.type = "Bar"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)
           
        }
    
    }
}
