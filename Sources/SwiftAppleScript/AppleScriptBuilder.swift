//
//  AppleScript.swift
//
//
//  Created by Max Chuquimia on 24/6/2024.
//

import Foundation

@resultBuilder
public struct AppleScript {

    public static func buildBlock(_ components: ScriptPart...) -> ScriptPart {
        let script = components
            .compactMap {
                guard !$0.script.isEmpty else { return nil }
                return $0.script
            }
            .joined(separator: "\n")

        return RawScriptPart(script: script)
    }

    public static func buildEither(first component: ScriptPart) -> ScriptPart {
        component
    }

    public static func buildEither(second component: ScriptPart) -> ScriptPart {
        component
    }

    public static func buildBlock() -> ScriptPart {
        EmptyScriptPart()
    }

    public static func buildIf(_ component: ScriptPart?) -> ScriptPart {
        component ?? EmptyScriptPart()
    }

    public static func buildExpression(_ expression: ScriptPart) -> ScriptPart {
        expression
    }

    public static func buildLimitedAvailability(_ component: ScriptPart) -> ScriptPart {
        component
    }

    public static func buildOptional(_ component: ScriptPart?) -> ScriptPart {
        component ?? EmptyScriptPart()
    }

}
