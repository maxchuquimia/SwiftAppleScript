//
//  Set.swift
//
//
//  Created by Max Chuquimia on 25/7/2024.
//

import Foundation

public struct Set: ScriptPart {

    let property: String
    let value: String

    public init(_ property: String, to value: String) {
        self.property = property
        self.value = value
    }

    public init(_ property: String, of expression: String, to value: String) {
        self.property = "\(property) of (\(expression))"
        self.value = value
    }

    public init(_ property: String, of expression: String, to value: Int) {
        self.property = "\(property) of (\(expression))"
        self.value = "\(value)"
    }

    public init(_ property: String, _ commands: @escaping () -> ScriptPart) {
        self.property = property
        self.value = commands().script
    }

    public var script: String {
        return "set \(property) to \(value)"
    }

}
