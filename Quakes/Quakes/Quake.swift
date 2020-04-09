//
//  Quake.swift
//  Quakes
//
//  Created by Nick Nguyen on 4/9/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation

//
class Quake : NSObject, Decodable
{
    
    enum CodingKeys : String, CodingKey {
        case magnitude = "mag"
        case time
        case place
        case latitude
        case longitude
        case properties
        case geometry
        case coordinates
    }
    
    let magnitude: Double
    let time: Date
    let place: String
    let latitude: Double
    let longitude: Double
    
    required init(from decoder: Decoder) throws {
        // containers to pull out data
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self) // top level
        let properties = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .properties)
        
        let geometry = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .geometry)
        var coordinates = try geometry.nestedUnkeyedContainer(forKey: .coordinates)
        
        self.magnitude = try properties.decode(Double.self, forKey: .magnitude)
        self.time = try properties.decode(Date.self, forKey: .time)
        self.place = try properties.decode(String.self, forKey: .place)
       
        // Longitude first
        self.longitude = try  coordinates.decode(Double.self)
        self.latitude = try coordinates.decode(Double.self)
        super.init()
        // Extract our properties
        
       
    }
    
    
}
