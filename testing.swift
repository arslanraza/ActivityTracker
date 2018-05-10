#!/usr/bin/swift

import Foundation
import ShellOut

//- set -o pipefail && xcodebuild -workspace ActivityTracker.xcworkspace -scheme ActivityTracker -sdk iphonesimulator -destination 'platform=iOS Simulator,OS=11.2,name=iPhone 7' build test | xcpretty -c --test --color || exit 1

//let arguments = [
//  "-workspace"
//  , "ActivityTracker.xcworkspace"
//  , "-scheme"
//  , "ActivityTracker"
//  , "-sdk"
//  , "iphonesimulator"
//  , "-destination"
//  , "'platform=iOS Simulator,OS=11.3,name=iPhone 7'"
//  , "build"
//  , "test"
//  , "| xcpretty -c --test --color"
//]
//
//let output = try shellOut(to: "xcodebuild", arguments: arguments)
//print("Result: \n\(output)")

// Create a FileManager instance

let fileManager = FileManager.default
// Get current directory path
let currentDirectoryPath = fileManager.currentDirectoryPath
let buildDirectoryPath = "\(currentDirectoryPath)/build"
print(buildDirectoryPath)
let payloadDirectoryPath = "\(currentDirectoryPath)/Payload"
let targetName = "ActivityTracker"
let targetAppName = "\(targetName).app"
let targetIPAName = "\(targetName).ipa"

// =========================================================
// Building app for testing, similar to CMD+SHIF+U in XCode
// =========================================================

let arguments = [
  "build-for-testing"
  , "-workspace"
  , "ActivityTracker.xcworkspace"
  , "-scheme"
  , targetName
  , "CONFIGURATION_BUILD_DIR=\(buildDirectoryPath)"
  , "| xcpretty -c --test --color"
]

let output = try shellOut(to: "xcodebuild", arguments: arguments)
print("Build Output: \n\(output)")

// =========================================================
// Creating Payload Directory
// =========================================================
if !fileManager.fileExists(atPath: payloadDirectoryPath) {
  do {
    try fileManager.createDirectory(atPath: payloadDirectoryPath, withIntermediateDirectories: false, attributes: nil)
  } catch {
    print("Payload directory creation failed at \(payloadDirectoryPath)")
  }
}

// =========================================================
// Copying .app file from Build folder to Payload folder
// =========================================================
let targetBuildPath = "\(buildDirectoryPath)/\(targetAppName)"
let payloadBuildPath = "\(payloadDirectoryPath)/\(targetAppName)"
print(targetBuildPath)
print(payloadBuildPath)
do {
  if fileManager.fileExists(atPath: payloadBuildPath) {
    do {
      try fileManager.removeItem(atPath: payloadBuildPath)
    } catch (let error) {
      print("Failed to remove existing file at path: \(payloadBuildPath)\nError: \(error)")
    }
  }
  
  try fileManager.copyItem(atPath: targetBuildPath, toPath: payloadBuildPath)
} catch (let error) {
  print("Failed to copy \(targetName).app to \(payloadDirectoryPath)\n Error: \(error)")
}

// =========================================================
// Making Payload ready for Bitbar by compressing the Payload and renaming it as .ipa
// =========================================================
try shellOut(to: "zip --symlinks -qr \"\(targetIPAName)\" Payload")


