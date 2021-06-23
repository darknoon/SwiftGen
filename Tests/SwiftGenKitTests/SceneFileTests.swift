//
// SwiftGenKit UnitTests
// Copyright © 2020 SwiftGen
// MIT Licence
//

import PathKit
@testable import SwiftGenKit
import TestUtils
import XCTest

final class SceneFileTests: XCTestCase {
  
  func testEmpty() throws {
    let parser = try SceneFile.Parser()
    
    let result = parser.stencilContext()
    XCTDiffContexts(result, expected: "empty", sub: .sceneFiles)
  }
  
  func testCube() throws {
    let parser = try SceneFile.Parser()
    try parser.searchAndParse(path: Fixtures.resource(for: "Cube.scn", sub: .sceneFiles))
    
    let result = parser.stencilContext()
    XCTDiffContexts(result, expected: "cube", sub: .sceneFiles)
  }
  
  func testHierarchy() throws {
    let parser = try SceneFile.Parser()
    try parser.searchAndParse(path: Fixtures.resource(for: "Hierarchy.scn", sub: .sceneFiles))
    
    let result = parser.stencilContext()
    XCTDiffContexts(result, expected: "hierarchy", sub: .sceneFiles)
  }
  
  
  func testAll() throws {
    let parser = try SceneFile.Parser()
    let paths = [
      "Cube.scn", "Hierarchy.scn"
    ]
    try parser.searchAndParse(paths: paths.map { Fixtures.resource(for: $0, sub: .sceneFiles) })
    
    let result = parser.stencilContext()
    XCTDiffContexts(result, expected: "all", sub: .sceneFiles)
  }
  
  // MARK: - Custom options
  
  func testUnknownOption() throws {
    do {
      _ = try SceneFile.Parser(options: ["SomeOptionThatDoesntExist": "foo"])
      XCTFail("Parser successfully created with an invalid option")
    } catch ParserOptionList.Error.unknownOption(let key, _) {
      // That's the expected exception we want to happen
      XCTAssertEqual(key, "SomeOptionThatDoesntExist", "Failed for unexpected option \(key)")
    } catch let error {
      XCTFail("Unexpected error occured: \(error)")
    }
  }
}
