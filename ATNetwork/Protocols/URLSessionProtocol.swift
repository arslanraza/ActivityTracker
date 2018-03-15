//
//  URLSessionProtocol.swift
//  ATNetwork
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
  typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
  
  func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
  func invalidateAndCancel()
}

// MARK: Extension for Detaul URLSession
extension URLSession: URLSessionProtocol {
  func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTaskProtocol {
    let task: URLSessionDataTask = dataTask(with: request, completionHandler: completionHandler)
    return task
  }
}

