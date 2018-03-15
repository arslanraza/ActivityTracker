//
//  ActivityInfoTableViewCell+Location.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import ATLocationCore
import ATNetwork

extension ActivityInfoTableViewCell {
  func configure(with activity: Activity, location: Location) {
    
    let profile = location.profiles.first(where: { $0.id == activity.profileID})
    
    // Setting the message by extracting the parameters
    let taskName = location.tasks.first(where: { $0.id == activity.taskID })?.name ?? ""
    let profileName = profile?.firstName ?? ""
    let parameters: [String: String] = ["profileName" : profileName,
                                        "taskName": taskName]
    descriptionLabel.text = activity.message.replacingParameters(parameters: parameters)
    typeLabel.text = activity.event
    
    // Setting the image
    let feed = LocationFeed.image(path: profile?.avatarMiniURL ?? "")
    if let url = feed.request.url {
      activityImageView.sd_setImage(with: url, completed: nil)
    }
  }
}
