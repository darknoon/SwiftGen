//
// SwiftGenKit
// Copyright © 2020 SwiftGen
// MIT Licence
//

import PathKit

public enum SceneFile {
    public final class Parser: SwiftGenKit.Parser {
        var files = [File]()
        private let options: ParserOptionValues
        public var warningHandler: Parser.MessageHandler?
        
        public init(options: [String: Any] = [:], warningHandler: Parser.MessageHandler? = nil) throws {
            self.options = try ParserOptionValues(options: options, available: Parser.allOptions)
            self.warningHandler = warningHandler
        }
        
        public static let defaultFilter = filterRegex(forExtensions: ["scn"])
        public static let filterOptions: Filter.Options = [.skipsDirectories, .skipsHiddenFiles, .skipsPackageDescendants]
        
        public func parse(path: Path, relativeTo parent: Path) throws {
            let catalog = try File(path: path)
            files += [catalog]
        }
    }
}
