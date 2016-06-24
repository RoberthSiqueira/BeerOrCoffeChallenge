//
//  BCViewController.swift
//  BeerOrCoffeeChallenge
//
//  Created by Roberth Siqueira on 23/06/16.
//  Copyright © 2016 Roberth Siqueira. All rights reserved.
//

import UIKit

class BCViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var streetTextField: UITextField!
    @IBOutlet var districtTextField: UITextField!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var ufTextField: UITextField!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var latitudeTextField: UITextField!
    @IBOutlet var longitudeTextField: UITextField!
    @IBOutlet var beverage: UIPickerView!
    var beverageArray = ["Cerveja", "Café", "Ambos"]
    var beverageValue: Int!
    
    @IBAction func addLocation() {
        if let location = getLocationFromForm() {
            
        }
    }
    
    func getLocationFromForm() -> Location? {
        if locationTextField == nil || streetTextField == nil || districtTextField == nil || cityTextField == nil || ufTextField == nil || countryTextField == nil || latitudeTextField == nil || longitudeTextField == nil {
            return nil
        } else {
            let location = locationTextField!.text
            let street = streetTextField!.text
            let district = districtTextField!.text
            let city = cityTextField!.text
            let uf = ufTextField!.text
            let country = countryTextField!.text
            let latitude = Double(latitudeTextField.text!)
            let longitude = Double(longitudeTextField!.text!)
            
            let place = Location(location: location!, street: street!, district: district!, city: city!, uf: uf!, country: country!, latitude: latitude!, longitude: longitude!, beverage: beverageValue)
            
            return place
        }
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return beverageArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return beverageArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        beverageValue = row + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

