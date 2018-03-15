//
//  Result.swift
//  ATNetwork
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

public enum Result<T, U: Error> {
  case success(T)
  case failure(U)
}
