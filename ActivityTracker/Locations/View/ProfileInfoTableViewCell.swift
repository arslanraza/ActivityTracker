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
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

extension ProfileInfoTableViewCell {
  func configure(with profile: Profile) {
    nameLabel.text = profile.firstName
    ratingLabel.text = String(profile.rating)
    descriptionLabel.text = profile.description
  }
}
