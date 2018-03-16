//
//  EndPoint.swift
//  ATNetwork
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation


/// A base EndPoint enum to define the base URL and the path to invoke the network request for
protocol EndPoint {
  var base: String { get }
  var path: String { get }
}

extension EndPoint {
  
  public var urlComponents: URLComponents {
    var components = URLComponents(string: base)!
    components.path = path
    return components
  }
  
  public var request: URLRequest {
    let url = urlComponents.url!
    return URLRequest(url: url)
  }
  
}

