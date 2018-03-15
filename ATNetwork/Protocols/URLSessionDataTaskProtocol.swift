//
//  URLSessionDataTaskProtocol.swift
//  ATNetwork
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

protocol URLSessionDataTaskProtocol {
  func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }
