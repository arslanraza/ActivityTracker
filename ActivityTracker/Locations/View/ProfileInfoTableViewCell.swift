//
//  ProfileInfoTableViewCell.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import ATLocationCore

class ProfileInfoTableViewCell: UITableViewCell {
  
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var profileImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    descriptionLabel.numberOfLines = 0
  }
}
