//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Ammulu on 09/01/18.
//  Copyright © 2018 JaganMohan. All rights reserved.
//

import UIKit
import CoreLocation


class WeatherViewController: UIViewController,CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    var geocoder = CLGeocoder()
    var placemark = CLPlacemark()
    var latitude: Double = 0
    var longitude: Double = 0
    var isCelsius: Bool?
    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImage.makeBloorImage(targetImageView: bgImage)

gettingCurrentLocationweather(cityNameString: "kadapa")
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("current location is\(location.coordinate)")
            latitude = location.coordinate.latitude
            longitude = location.coordinate.longitude
        }
    }
    func gettingCurrentLocationweather(cityNameString:String) {
        let aStr : String = String(format: "http://api.openweathermap.org/data/2.5/weather?q=%@&APPID=43679b57a5efdc27b9bb2c09c648a1a2",cityNameString)
        let urlString = URL(string: aStr)
        
        
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error ?? "error")
                } else {
                    if let usableData = data {
                        print("usableData :",usableData)
                        
                        if let stringData:String = String(data: usableData, encoding: String.Encoding.utf8) {
                            print("stringData"+stringData)
                            
                            //***************Json serialization****************
                            let data: Data = usableData
                            var json: Any
                            do {
                                json = try JSONSerialization.jsonObject(with: data)
                                
                                //[Any] to get array object and [String: Any] for diactionary object
                                let dataDict = json as? [String: Any]
                                let city = dataDict!["name"]
                                if let main=dataDict?["main"] as? [String:Any]{
                                    let temp = main["temp"]
                                    let temp_max = main["temp_max"]
                                    let temp_min = main["temp_min"]
                                    print(" The  data\(String(describing: temp_max)) ")
                                DispatchQueue.main.async {
                                self.cityLabel.text = city as? String
                                    self.temperatureLabel.text = "\((temp)!))"
                                    self.lowTemp.text = "\((temp_min)!))"
                                    self.highTemp.text = "\((temp_max)!))"

                                   }
                                }
                            } catch {
                                print(error)
                            }
                        }
                    }
                }
            }
            task.resume()
        }
}
    func converter(temp: Int) -> Int {
        if isCelsius! {
            return (((temp-32) * 5)/9)
        }
        return temp
    }
}
