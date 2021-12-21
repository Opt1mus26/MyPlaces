//
//  CustomTableViewCell.swift
//  MyPlaces
//
//  Created by Pavel Tsyganov on 21.12.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var imageOfPlace: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    
    func configure(with places: Place) {
        imageOfPlace.image = UIImage(named: places.image)
        nameLabel.text = places.name
        locationLabel.text = places.location
        typeLabel.text = places.type
    }
    
}
