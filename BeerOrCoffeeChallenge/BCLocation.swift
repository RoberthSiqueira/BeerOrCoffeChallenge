//
//  BCLocation.swift
//  BeerOrCoffeeChallenge
//
//  Created by Roberth Siqueira on 24/06/16.
//  Copyright © 2016 Roberth Siqueira. All rights reserved.
//

import Foundation

class Location {
    let name: String
    let street: String
    let district: String
    let city: String
    let uf: String
    let country: String
    let latitude: Double
    let longitude: Double
    let beverage: Int
    init(name: String, street: String, district: String, city: String, uf: String, country: String, latitude: Double, longitude: Double, beverage: Int) {
        self.name = name
        self.street = street
        self.district = district
        self.city = city
        self.uf = uf
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.beverage = beverage
    }
    func getAddress() -> String {
        let address = (street +
            " - " + district +
            " - " + city +
            ", " + uf +
            ". " + country)
        return address
    }
    func queryForSearch() -> String {
        let query = name + getAddress()
        return query
    }
}