//
//  MockURLSession.swift
//  ATNetworkTests
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
@testable import ATNetwork

class MockURLSession: URLSessionProtocol {
  
  private(set) var invalidateCalled = false
  var nextDataTask = MockURLSessionDataTask()
  var nextData: Data?
  var nextError: Error?
  
  private (set) var lastURL: URL?
  
  func successHttpURLResponse(request: URLRequest) -> URLResponse {
    return HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
  }
  
  func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
    lastURL = request.url
    
    completionHandler(nextData, successHttpURLResponse(request: request), nextError)
    return nextDataTask
  }
  
  func invalidateAndCancel() {
    invalidateCalled = true
  }
  
}
