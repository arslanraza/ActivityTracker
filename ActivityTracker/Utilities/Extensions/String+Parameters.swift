//
//  String+Parameters.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

extension String {
  
  /// Returns a string by finding and replacing occurances of parameters as keys from the dictionary
  ///
  /// - Parameter parameters: A [String: String] dictionary
  /// - Returns: A copy of the self with parameters replaced
  func replacingParameters(parameters: [String: String]) -> String {
    var mutableCopy = self
    for key in parameters.keys {
      let parameter = "{\(key)}"
      mutableCopy = mutableCopy.replacingOccurrences(of: parameter, with: parameters[key]!)
    }
    return mutableCopy
  }
}
