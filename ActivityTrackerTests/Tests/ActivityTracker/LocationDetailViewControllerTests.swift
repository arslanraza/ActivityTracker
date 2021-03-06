//
//  LocationDetailViewControllerTests.swift
//  ActivityTrackerTests
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import ActivityTracker
@testable import ATLocationCore

class LocationDetailViewControllerTests: QuickSpec {
  override func spec() {
    describe("LocationDetail controller") {
      
      context("when displayed", {
        let sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LocationDetailViewController") as! LocationDetailViewController
        sut.locationID = 0
        sut.location = Location.init(id: 1, displayName: "Test", lat: "0", lan: "0", workerCount: 0, workerIDs: [], recentActivities: [], profiles: [], tasks: [])
        let _ = sut.view
        it("should have a tableView", closure: {
          expect(sut.tableView).notTo(beNil())
        })
      })
    }
  }
}

