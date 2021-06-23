//
// SwiftGen
// Copyright © 2020 SwiftGen
// MIT Licence
//

import PathKit
import SceneKit

extension SceneFile {
  public enum ParserError: Error, CustomStringConvertible {
    case couldNotLoadSceneFile(path: Path)
    public var description: String {
      switch self {
      case .couldNotLoadSceneFile(path: let path):
        return "Could not load SceneKit file \(path)."
      }
    }
  }
  struct File {
    let path: Path
    let name: String
    let scene: SCNScene
    
    init(path: Path, relativeTo parent: Path? = nil) throws {
      
      do {
        scene = try SCNScene(url: path.url, options: [.useSafeMode: true])
      } catch {
        throw ParserError.couldNotLoadSceneFile(path: path)
      }
      
      self.path = parent.flatMap { path.relative(to: $0) } ?? path
      self.name = path.lastComponentWithoutExtension
    }
  }
}
