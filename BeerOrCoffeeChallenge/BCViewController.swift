//
//  BCViewController.swift
//  BeerOrCoffeeChallenge
//
//  Created by Roberth Siqueira on 23/06/16.
//  Copyright © 2016 Roberth Siqueira. All rights reserved.
//

import UIKit

class BCViewController: UIViewController {
    @IBOutlet var localTextField: UITextField!
    @IBOutlet var streetTextField: UITextField!
    @IBOutlet var districtTextField: UITextField!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var ufTextField: UITextField!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var latitudeTextField: UITextField!
    @IBOutlet var longitudeTextField: UITextField!
    @IBOutlet var beverage: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

