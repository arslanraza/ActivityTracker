#!/usr/bin/swift

import Foundation
import ShellOut // marathon:https://github.com/JohnSundell/ShellOut.git
import Files // marathon:https://github.com/JohnSundell/Files.git


// Get current directory path
let currentFolder = Folder.current
let bitbarFolder = try currentFolder.createSubfolderIfNeeded(withName: "Bitbar")
let buildFolder = try bitbarFolder.createSubfolderIfNeeded(withName: "Build")
print("Build path: \(buildFolder.path)")
let payloadFolder = try bitbarFolder.createSubfolderIfNeeded(withName: "Payload")
let targetName = "ActivityTracker"
let targetAppName = "\(targetName).app"
let targetIPAName = "\(targetName).ipa"
let targetTestName = "\(targetName)Tests.xctest"

// =========================================================
// Building app for testing, similar to CMD+SHIF+U in XCode
// =========================================================

let arguments = [
  "build-for-testing"
  , "-workspace"
  , "ActivityTracker.xcworkspace"
  , "-scheme"
  , targetName
  , "CONFIGURATION_BUILD_DIR=\(buildFolder.path)"
  , "| xcpretty -c --test --color"
]

let output = try shellOut(to: "xcodebuild", arguments: arguments)
print("Build Output: \n\(output)")

// =========================================================
// Extensions for File and Folder classes
// =========================================================

extension File {
  public func copy(to folder: Folder, overwrite: Bool = false) throws -> File {
    if overwrite {
      do {
        let existingFile = try folder.file(named: name)
        try existingFile.delete()
      }
    }
    return try copy(to: folder)
  }
}

extension Folder {
  public func copy(to folder: Folder, overwrite: Bool = false) throws -> Folder {
    if overwrite {
      do {
        let existingFolder = try folder.subfolder(named: name)
        try existingFolder.delete()
      } catch (let error) {
        print("No existing folder found to be deleted: \(error)")
      }
    }
    return try copy(to: folder)
  }
}

// =========================================================
// Copying .app file from Build folder to Payload folder
// =========================================================
do {
  let appFile = try buildFolder.subfolder(named: targetAppName).copy(to: payloadFolder, overwrite: true)
  //  let appFile = try buildDirectory.file(named: "ATNetworkTests.xctest") //.copy(to: payloadDirectory)
  let targetIPAPath = bitbarFolder.path+targetIPAName
  try shellOut(to: "cd Bitbar; zip --symlinks -qr \"\(targetIPAPath)\" Payload ; cd ..")
  print(".app file path: \(appFile.path)")
} catch (let error) {
  print("Failed to copy \(targetAppName) to \(payloadFolder.path)\nError: \(error)")
}

// =========================================================
// Copying .xctest file from Build/Target.app folder to Bitbar and perform compression
// =========================================================
do {
  let plugInsFolder = try payloadFolder.subfolder(named: targetAppName).subfolder(named: "PlugIns")
  let testTarget = try plugInsFolder.subfolder(named: targetTestName).copy(to: bitbarFolder, overwrite: true)
  try shellOut(to: "cd Bitbar; zip --symlinks -qr \"\(testTarget.name).zip\" \(testTarget.name) ; cd ..")
  try testTarget.delete()
} catch (let error) {
  print("Error: \(error)")
}

