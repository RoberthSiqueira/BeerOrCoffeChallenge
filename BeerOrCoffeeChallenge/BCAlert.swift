//
//  BCAlert.swift
//  BeerOrCoffeeChallenge
//
//  Created by Roberth Siqueira on 24/06/16.
//  Copyright © 2016 Roberth Siqueira. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    func show(message:String = "Erro inesperado.") {
        let details = UIAlertController(title: "Aviso",
                                        message: message,
                                        preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "OK",
                                   style: UIAlertActionStyle.Cancel,
                                   handler: nil)
        details.addAction(cancel)
        controller.presentViewController(details, animated: true, completion: nil)
    }
}