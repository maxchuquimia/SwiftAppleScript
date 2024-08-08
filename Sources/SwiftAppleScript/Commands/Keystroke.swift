//
//  Keystroke.swift
//
//
//  Created by Max Chuquimia on 24/6/2024.
//

import Foundation

public struct Keystroke: ScriptPart {

    public enum Modifier: String {
        case command = "command"
        case control = "control"
        case option = "option"
        case shift = "shift"
    }

    let key: String
    let using: [Modifier]

    public init(_ key: String, using modifiers: Modifier...) {
        self.key = key
        self.using = modifiers
    }

    public var script: String {
        let modifiers = using.map { $0.rawValue + " down" }.joined(separator: ", ")
        return if modifiers.isEmpty {
            "keystroke \"\(key)\""
        } else {
            "keystroke \"\(key)\" using {\(modifiers)}"
        }
    }

}
