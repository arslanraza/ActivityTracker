//
//  Task.swift
//  ATLocationCore
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

public struct Task: Codable {
  public let id: Int
  public let name: String
  public let description: String
  public let state: String
  public let posterID: Int
  public let workerID: Int?
  
  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case description
    case state
    case posterID = "poster_id"
    case workerID = "worker_id"
  }
}
