//
//  Click.swift
//
//
//  Created by Max Chuquimia on 24/6/2024.
//

import Foundation

public struct Click: ScriptPart {

    let target: String

    public init(menuItem: String) {
        self.target = "menu item \"\(menuItem)\""
    }

    public var script: String {
        return "click \(target)"
    }

}
