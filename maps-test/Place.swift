//
//  Place.swift
//  maps-test
//
//  Created by Vlad Md Golam on 28.05.2018.
//  Copyright © 2018 Vlad Md Golam. All rights reserved.
//

import Foundation
import GoogleMaps

struct Place: Hashable {
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Place, rhs: Place) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
//    CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
    
    var location: CLLocationCoordinate2D
    var title: String
    var snippet: String?
    
    private var identifier: Int
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(location: CLLocationCoordinate2D, title: String, snippet: String?) {
        self.identifier = Place.getUniqueIdentifier()
        self.location = location
        self.title = title
        self.snippet = snippet != nil ? snippet! : ""
    }
    
    init(latitude: Double, longitude: Double, title: String, snippet: String?) {
        self.identifier = Place.getUniqueIdentifier()
        self.location = CLLocationCoordinate2DMake(latitude, longitude)
        self.title = title
        self.snippet = snippet != nil ? snippet! : ""
    }
    
}
