//
//  APIClientTests.swift
//  ATNetworkTests
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit

import UIKit
import Quick
import Nimble
@testable import ATNetwork

class APIClientTests: QuickSpec {
  override func spec() {
    describe("APIClient") {
      
      context("after initializing with data", {
        
        let data = "{\"name\": \"test\"}".data(using: .utf8)
        
        let api = MockAPI(with: data, expectedError: nil)
        var success = false
        let request = URLRequest(url: URL(string: "http://someurl.com")!)
        
        it("should return object", closure: {
          api.fetch(with: request, decode: { json -> MockObject? in
            guard let object = json as? MockObject else {
              return  nil
            }
            return object
          }, completion: { result in
            switch result {
            case .success(let object):
              success = object.name == "test"
            case .failure(_):
              print("error: ")
            }
          })
          expect(success).toEventually(beTrue())
        })
        
        it("should cancel if invalidate is called", closure: {
          let mockSession = api.session as! MockURLSession
          mockSession.invalidateAndCancel()
          expect(mockSession.invalidateCalled).to(beTrue())
        })
        
      })
    }
  }
}
