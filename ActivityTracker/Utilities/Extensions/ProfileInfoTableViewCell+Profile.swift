//
//  ProfileInfoTableViewCell+Profile.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import ATLocationCore

extension ProfileInfoTableViewCell {
  func configure(with profile: Profile) {
    nameLabel.text = profile.firstName
    ratingLabel.text = String(profile.rating)
    descriptionLabel.text = profile.description
  }
}
