//
//  MockAPIClient.swift
//  ATNetworkTests
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
@testable import ATNetwork

class MockAPI: APIClient {
  var session: URLSessionProtocol
  
  init(with expectedData: Data?, expectedError: Error?) {
    let mockSession = MockURLSession()
    mockSession.nextData = expectedData
    mockSession.nextError = expectedError
    self.session = mockSession
  }
  
}

