//
//  Profile.swift
//  ATLocationCore
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

public struct Profile: Codable {
  public let id: Int
  public let avatarMiniURL: String
  public let firstName: String
  public let description: String
  public let rating: Float
  public let locationID: Int
  
  private enum CodingKeys: String, CodingKey {
    case id
    case avatarMiniURL = "avatar_mini_url"
    case firstName = "first_name"
    case description
    case rating
    case locationID = "location_id"
  }
}
