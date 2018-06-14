//
//  Map.swift
//  maps-test
//
//  Created by Vlad Md Golam on 28.05.2018.
//  Copyright © 2018 Vlad Md Golam. All rights reserved.
//

import Foundation
import GoogleMaps
import Alamofire
import SwiftyJSON

struct Map {
    private(set) var places = [Place]()
    
    init() {
        addPlace(place: Place(latitude: 55.728412, longitude: 37.635370, title: "ВШЭ", snippet: "Школа дизайна НИУ ВШЭ"))
        addPlace(place: Place(latitude: 55.729669, longitude: 37.636358, title: "Хлеб Насущный", snippet: "кафе"))
        addPlace(place: Place(latitude: 55.730183, longitude: 37.635864, title: "Старбакс", snippet: "кофейня"))
    }
//    55.729578, 37.635242

    
    mutating func addPlace(place: Place) {
        places.append(place)
    }
 
//    http://192.168.10.206:3000/api/v1/mapdots
//    https://jsonplaceholder.typicode.com/posts

    func fetch() {
        print("Supchik!")
        request("http://192.168.1.66:3000/api/v1/mapdots").responseJSON { responseJSON in
            
            switch responseJSON.result {
            case .success(let value):
                
                let data = JSON(value)
                print(data["data"])
                print("OK")
                
                
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}
