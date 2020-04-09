//
//  Quake+MKAnnotation.swift
//  Quakes
//
//  Created by Nick Nguyen on 4/9/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import MapKit

extension Quake : MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    var title: String? {
        return place
    }
    var subtitle: String? {
        if let magnitude = magnitude {
            return "Magnitude: \(magnitude)"
        } else {
            return "Magnitude: N/A"
        }
    }
    
    
}
