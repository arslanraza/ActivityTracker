//
//  MockURLSessionDataTask.swift
//  ATNetworkTests
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
@testable import ATNetwork

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
  private (set) var resumeWasCalled = false
  
  func resume() {
    resumeWasCalled = true
  }
}

