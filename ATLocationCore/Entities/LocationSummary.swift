//
//  LocationSummary.swift
//  ATLocationCore
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import CoreLocation

public struct LocationSummary: Codable {
  
  public let id: Int
  public let displayName: String
  public let lat: String
  public let lan: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case displayName = "display_name"
    case lat = "latitude"
    case lan = "longitude"
  }
  
}
