//
// SwiftGenKit
// Copyright © 2020 SwiftGen
// MIT Licence
//

import Foundation
import SceneKit

//
// See the documentation file for a full description of this context's structure:
// Documentation/SwiftGenKit Contexts/ib.md
//

extension SceneFile.Parser {
  
  public func stencilContext() -> [String: Any] {
    let files = self.files
      .sorted { lhs, rhs in lhs.name < rhs.name }
      .map(map(scn: ))
    return [
      "sceneFiles": files
    ]
  }
  
  private func map(scn: SceneFile.File) -> [String: Any] {
    [
      "name": scn.name,
      "rootNode": map(node: scn.scene.rootNode)
    ]
  }
  
  private func map(node: SCNNode) -> [String: Any] {
    var result: [String: Any] = [
      "hasGeometry": node.geometry != nil,
      "hasLight": node.light != nil,
      "isHidden": node.isHidden,
      "animationKeys": node.animationKeys,
      "children": node.childNodes.map(map(node: ))
    ]
    if let name = node.name {
      result["name"] = name
    }
    return result
  }
  
}
