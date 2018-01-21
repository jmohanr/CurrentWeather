//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ammulu on 09/01/18.
//  Copyright © 2018 JaganMohan. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    var dataDict = [String:Any]()
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func loginAction(_ sender: Any) {
       dataDict = queryToYahoo(cityNameString: "kadapa")
        print(dataDict)
    }
    
}
