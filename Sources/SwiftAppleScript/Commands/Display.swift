//
//  Display.swift
//
//
//  Created by Max Chuquimia on 5/8/2024.
//

import Foundation

public struct Display: ScriptPart {

    let target: String

    public init(dialog: String) {
        self.target = "display dialog \"\(dialog)\""
    }

    public var script: String {
        return target
    }

}
