//
//  Runner.swift
//
//
//  Created by Max Chuquimia on 24/6/2024.
//

import Foundation

public extension ScriptPart {

    func run() throws {
        guard let appleScript = NSAppleScript(source: script) else {
            throw SwiftAppleScriptError.failedToInstantiate
        }

        var error: NSDictionary?
        appleScript.executeAndReturnError(&error)

        if let error = error?.compactMap({ $0.1 as? Error }).first {
            throw SwiftAppleScriptError.failedToRun(error)
        }
    }

}

public enum SwiftAppleScriptError: Error {
    case failedToInstantiate
    case failedToRun(Error)
}
