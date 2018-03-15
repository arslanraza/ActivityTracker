//
//  ActivityInfoTableViewCell.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import ATLocationCore

class ActivityInfoTableViewCell: UITableViewCell {
  
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var activityImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    descriptionLabel.numberOfLines = 0
  }
}

