//
//  Location+Coordinates.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import ATLocationCore
import CoreLocation

extension Location {
  var coordinates: CLLocationCoordinate2D {
    guard let lat = Double(lat),
      let lon = Double(lan) else {
        return CLLocationCoordinate2D()
    }
    
    return CLLocationCoordinate2D(latitude: lat, longitude: lon)
  } 
  
}
