//
//  BCLocation.swift
//  BeerOrCoffeeChallenge
//
//  Created by Roberth Siqueira on 24/06/16.
//  Copyright © 2016 Roberth Siqueira. All rights reserved.
//

import Foundation

class Location {
    let location: String
    let address: String
    let district: String
    let city: String
    let uf: String
    let country: String
    let latitude: String
    let longitude: String
    init(location: String, address: String, district: String, city: String, uf: String, country: String, latitude: String, longitude: String) {
        self.location = location
        self.address = address
        self.district = district
        self.city = city
        self.uf = uf
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
    }
    
}