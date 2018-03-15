//
//  UITableViewCell+ReuseIdentifier.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit

extension UITableViewCell {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}
