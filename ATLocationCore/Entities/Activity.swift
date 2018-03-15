//
//  Activity.swift
//  ATLocationCore
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

public struct Activity: Codable {
  public let taskID: Int
  public let profileID: Int
  public let message: String
  public let createdAt: String?
  public let event: String
  
  private enum CodingKeys: String, CodingKey {
    case taskID = "task_id"
    case profileID = "profile_id"
    case message
    case createdAt = "created_at"
    case event
  }
}
