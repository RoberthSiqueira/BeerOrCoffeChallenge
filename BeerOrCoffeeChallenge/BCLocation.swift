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
    let street: String
    let district: String
    let city: String
    let uf: String
    let country: String
    let latitude: Double
    let longitude: Double
    let beverage: Int
    init(location: String, street: String, district: String, city: String, uf: String, country: String, latitude: Double, longitude: Double, beverage: Int) {
        self.location = location
        self.street = street
        self.district = district
        self.city = city
        self.uf = uf
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.beverage = beverage
    }
    
}