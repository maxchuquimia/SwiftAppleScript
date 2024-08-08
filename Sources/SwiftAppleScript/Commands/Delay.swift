//
//  Delay.swift
//  
//
//  Created by Max Chuquimia on 6/8/2024.
//

import Foundation

public struct Delay: ScriptPart {

    let seconds: TimeInterval

    public init(_ seconds: TimeInterval) {
        self.seconds = seconds
    }

    public var script: String {
        return "delay \(seconds)"
    }

}
