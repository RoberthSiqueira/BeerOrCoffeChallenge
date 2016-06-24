//
//  BCViewController.swift
//  BeerOrCoffeeChallenge
//
//  Created by Roberth Siqueira on 23/06/16.
//  Copyright © 2016 Roberth Siqueira. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Contacts
import Alamofire

class BCViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, CLLocationManagerDelegate {
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
    var manager:CLLocationManager!
    
    @IBAction func addLocation() {
        if let location = getLocationFromForm() {
            let query = location.name + location.getAddress()
            foundLocal(query)
        }
    }
    
    func getLocationFromForm() -> Location? {
        if locationTextField == nil || streetTextField == nil || districtTextField == nil || cityTextField == nil || ufTextField == nil || countryTextField == nil || latitudeTextField == nil || longitudeTextField == nil {
            Alert(controller: self).show("Por favor, preencha todos os campos")
            return nil
        } else {
            let name = locationTextField!.text
            let street = streetTextField!.text
            let district = districtTextField!.text
            let city = cityTextField!.text
            let uf = ufTextField!.text
            let country = countryTextField!.text
            let latitude = Double(latitudeTextField.text!)
            let longitude = Double(longitudeTextField!.text!)
            
            let place = Location(name: name!, street: street!, district: district!, city: city!, uf: uf!, country: country!, latitude: latitude!, longitude: longitude!, beverage: beverageValue)
            
            return place
        }
    }
    
    func foundLocal(query: String) {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = query
        let search = MKLocalSearch(request: request)
        
        search.startWithCompletionHandler({ (response, error) in
            if error != nil {
                Alert(controller: self).show()
            } else if response?.mapItems.count == 0 {
                Alert(controller: self).show("Local não encontrado. Verifique os dados informados.")
            } else {
                self.requestApi()
            }
        })
    }
    
    func requestApi() {
        if let location = self.getLocationFromForm() {
            let api = "https://c7q5vyiew7.execute-api.us-east-1.amazonaws.com/prod/places"
            let paramJson: [String:AnyObject] = ["name": location.name,
                                                "address": location.getAddress(),
                                                "latitude": -7,
                                                "longitude": 27,
                                                "beverage": location.beverage]
            let headers = ["Content-Type":"application/json",
                           "x-api-key":"IfXJnQVdjo1fI4z6OQTWB6RPJ8Qs4JbcaDOZ83vt"]
            Alamofire.request(.POST, api, parameters: paramJson, encoding:.JSON, headers: headers).responseJSON { response in
                print(response.result.value)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error) -> Void in
            if error != nil {
                Alert(controller: self).show()
                return
            } else {
                let lat = Double((manager.location?.coordinate.latitude)!)
                let long = Double((manager.location?.coordinate.longitude)!)
                let place = placemarks?.last
                self.streetTextField.text = place!.addressDictionary?["Street"] as? String
                self.districtTextField.text = place!.addressDictionary?["SubLocality"] as? String
                self.cityTextField.text = place!.addressDictionary?["City"] as? String
                self.ufTextField.text = place!.addressDictionary?["State"] as? String
                self.countryTextField.text = place!.addressDictionary?["Country"] as? String
                self.latitudeTextField.text = String(lat)
                self.longitudeTextField.text = String(long)
            }
        })
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
}

