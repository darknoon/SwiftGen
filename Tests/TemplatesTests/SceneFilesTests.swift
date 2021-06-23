//
// Templates UnitTests
// Copyright © 2020 SwiftGen
// MIT Licence
//

import StencilSwiftKit
import XCTest

final class SceneFilesTests: XCTestCase {
  private enum Contexts {
    static let all = ["empty", "defaults"]
  }

  private let variations: VariationGenerator = { name, context in
    guard name == "defaults" else { return [(context: context, suffix: "")] }

    return [
        // TODO: options
      (
        context: context,
        suffix: ""
      ),
    ]
  }

  func testSwift4() {
    test(
      template: "swift4",
      contextNames: Contexts.all,
      directory: .sceneFiles,
      contextVariations: variations
    )
  }

  func testSwift5() {
    test(
      template: "swift5",
      contextNames: Contexts.all,
      directory: .sceneFiles,
      contextVariations: variations
    )
  }

}
