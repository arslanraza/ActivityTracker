//
//  LocationFeed.swift
//  ATNetwork
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

//https://s3-ap-southeast-2.amazonaws.com/ios-code-test/v2/locations.json
//
//The data for the details view could be accessed using these endpoints:
//https://s3-ap-southeast-2.amazonaws.com/ios-code-test/v2/location/<location id>.json
//https://s3-ap-southeast-2.amazonaws.com/ios-code-test/v2/<img url>


public enum LocationFeed {
  case locations
  case locationDetail(id: Int)
  case image(path: String)
}

extension LocationFeed: EndPoint {
  public var base: String {
    return "https://s3-ap-southeast-2.amazonaws.com"
  }
  
  public var path: String {
    
    let pathPrefix = "/ios-code-test/v2"
    
    switch self {
    case .locations:
      return pathPrefix.appending("/locations.json")
    case .locationDetail(let id):
      return pathPrefix.appending("/location/\(id).json")
    case .image(let imagePath):
      return pathPrefix.appending("\(imagePath)")
    }
  }
}
