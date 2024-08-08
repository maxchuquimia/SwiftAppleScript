// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "SwiftAppleScript",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "SwiftAppleScript",
            targets: ["SwiftAppleScript"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftAppleScript"),
        .testTarget(
            name: "SwiftAppleScriptTests",
            dependencies: ["SwiftAppleScript"]
        ),
    ]
)
