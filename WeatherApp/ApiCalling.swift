//
//  ApiCalling.swift
//  WeatherApp
//
//  Created by Ammulu on 09/01/18.
//  Copyright © 2018 JaganMohan. All rights reserved.
//

import Foundation

func queryToYahoo(cityNameString: String) -> Dictionary<String, AnyObject> {
    let query : String = String(format: "http://api.openweathermap.org/data/2.5/weather?q=%@&APPID=43679b57a5efdc27b9bb2c09c648a1a2",cityNameString)
    
    var dictionary: Dictionary<String, AnyObject>?
    do {
        let data: Data = try Data(contentsOf: URL(string:query)!) as Data
        dictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)  as? Dictionary<String, AnyObject>
    } catch {
        print("Error loading data...")
    }
    return dictionary!
}
/*
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
                            print(dataDict ?? "")
                            
                            
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        }
        task.resume()
    }
    */
 }*/
