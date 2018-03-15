//
//  Location.swift
//  ATLocationCore
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

public struct Location: Codable {
  
  public let id: Int
  public let displayName: String
  public let lat: String
  public let lan: String
  public let workerCount: Int
  
  public let workerIDs: [Int]
  public let recentActivities: [Activity]
  public let profiles: [Profile]
  public let tasks: [Task]
  
  private enum CodingKeys: String, CodingKey {
    case id
    case displayName = "display_name"
    case lat = "latitude"
    case lan = "longitude"
    case workerCount = "worker_count"
    
    case workerIDs = "worker_ids"
    case recentActivities = "recent_activity"
    case profiles
    case tasks
  }
}

extension Location {
  public init(_ locationSummary: LocationSummary) {
    
    self.init(id: locationSummary.id,
              displayName: locationSummary.displayName,
              lat: locationSummary.lat,
              lan: locationSummary.lan,
              workerCount: 0,
              workerIDs: [],
              recentActivities: [],
              profiles: [],
              tasks: [])
  }
}

