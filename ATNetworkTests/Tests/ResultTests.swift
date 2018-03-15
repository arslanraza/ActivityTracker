//
//  ResultTests.swift
//  ATNetworkTests
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import ATNetwork

class ResultTests: QuickSpec {
  override func spec() {
    describe("A Result") {
      context("when initialized for int", {
        
        let result = Result<Int, APIError>.success(1)
        
        it("should match success value", closure: {
          switch result {
          case .success(let value):
            expect(value) == 1
          default: break
          }
        })
        
      })
      
      context("when initialized for String", {
        
        let result = Result<String, APIError>.success("some-test")
        
        it("should match success value", closure: {
          switch result {
          case .success(let value):
            expect(value) == "some-test"
          default: break
          }
        })
        
      })
    }
  }
}
