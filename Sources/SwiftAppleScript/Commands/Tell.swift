//
//  Tell.swift
//
//
//  Created by Max Chuquimia on 24/6/2024.
//

import Foundation

public struct Tell: ScriptPart {

    let target: String
    @AppleScript let commands: () -> ScriptPart

    public init(application: String, @AppleScript _ commands: @escaping () -> ScriptPart) {
        self.target = "application \"\(application)\""
        self.commands = commands
    }

    public init(applicationProcess: String, @AppleScript _ commands: @escaping () -> ScriptPart) {
        self.target = "application process \"\(applicationProcess)\""
        self.commands = commands
    }

    public init(menuBar: Int, @AppleScript _ commands: @escaping () -> ScriptPart) {
        self.target = "menu bar \(menuBar)"
        self.commands = commands
    }

    public init(menuBarItem: String, @AppleScript _ commands: @escaping () -> ScriptPart) {
        self.target = "menu bar item \"\(menuBarItem)\""
        self.commands = commands
    }

    public init(menu: String, @AppleScript _ commands: @escaping () -> ScriptPart) {
        self.target = "menu \"\(menu)\""
        self.commands = commands
    }

    public init(menuItem: String, @AppleScript _ commands: @escaping () -> ScriptPart) {
        self.target = "menu item \"\(menuItem)\""
        self.commands = commands
    }

    public var script: String {
        let script = commands().script
        return "tell \(target)\n\(script)\nend tell"
    }

}
