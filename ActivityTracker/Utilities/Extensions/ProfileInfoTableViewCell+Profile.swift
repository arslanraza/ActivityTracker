//
//  ProfileInfoTableViewCell+Profile.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import ATLocationCore
import ATNetwork
import SDWebImage

extension ProfileInfoTableViewCell {
  func configure(with profile: Profile) {
    nameLabel.text = profile.firstName
    ratingLabel.text = String(profile.rating)
    descriptionLabel.text = profile.description
    
    let feed = LocationFeed.image(path: profile.avatarMiniURL)
    if let url = feed.request.url {
      profileImageView.sd_setImage(with: url, completed: nil)
    }
  }
}
