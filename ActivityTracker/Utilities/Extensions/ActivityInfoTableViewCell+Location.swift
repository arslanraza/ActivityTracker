//
//  ActivityInfoTableViewCell+Location.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import ATLocationCore

extension ActivityInfoTableViewCell {
  func configure(with activity: Activity, location: Location) {
    
    let profileName = location.profiles.first(where: { $0.id == activity.profileID})?.firstName ?? ""
    let taskName = location.tasks.first(where: { $0.id == activity.taskID })?.name ?? ""
    let parameters: [String: String] = ["profileName" : profileName,
                                        "taskName": taskName]
    descriptionLabel.text = activity.message.replacingParameters(parameters: parameters)
    typeLabel.text = activity.event
  }
}
