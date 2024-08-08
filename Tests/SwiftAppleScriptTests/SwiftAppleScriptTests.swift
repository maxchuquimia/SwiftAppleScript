import XCTest
import SwiftAppleScript

final class SwiftAppleScriptTests: XCTestCase {

    func testTell() throws {
        @AppleScript
        func build() -> ScriptPart {
            Tell(application: "Finder") {
                Activate()
            }

            Tell(application: "Xcode") {
                Activate()
            }
        }

        XCTAssertEqual(build().script, "tell application \"Finder\"\nactivate\nend tell\ntell application \"Xcode\"\nactivate\nend tell")
    }

    func testKeystroke() throws {
        @AppleScript
        func build() -> ScriptPart {
            Tell(application: "System Events") {
                Keystroke("a", using: .command, .control)
                Keystroke("b")
            }
        }

        XCTAssertEqual(build().script, "tell application \"System Events\"\nkeystroke \"a\" using {command down, control down}\nkeystroke \"b\"\nend tell")
    }

    func testBuildEither() throws {
        var isA = false

        @AppleScript
        func build() -> ScriptPart {
            Tell(application: "System Events") {
                if isA {
                    Keystroke("a", using: .command)
                } else {
                    Keystroke("b")
                }
            }
        }

        XCTAssertEqual(build().script, "tell application \"System Events\"\nkeystroke \"b\"\nend tell")

        isA = true

        XCTAssertEqual(build().script, "tell application \"System Events\"\nkeystroke \"a\" using {command down}\nend tell")
    }

    func testEmpty() {
        @AppleScript
        func build() -> ScriptPart {

        }

        XCTAssertEqual(build().script, "")
    }

    func testIf() {
        var isA = true

        @AppleScript
        func build() -> ScriptPart {
            if isA {
                Keystroke("A")
            }
        }

        XCTAssertEqual(build().script, "keystroke \"A\"")

        isA = false

        XCTAssertEqual(build().script, "")
    }

    func testClickMenuItem() throws {
        @AppleScript
        func build() -> ScriptPart {
            Tell(application: "Xcode") {
                Activate()
                Tell(application: "System Events") {
                    Tell(applicationProcess: "Xcode") {
                        Tell(menuBar: 1) {
                            Tell(menuBarItem: "File") {
                                Tell(menu: "File") {
                                    Tell(menuItem: "Packages") {
                                        Tell(menu: "Packages") {
                                            Click(menuItem: "Resolve Package Versions")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        XCTAssertEqual(build().script, "tell application \"Xcode\"\nactivate\ntell application \"System Events\"\ntell application process \"Xcode\"\ntell menu bar 1\ntell menu bar item \"File\"\ntell menu \"File\"\ntell menu item \"Packages\"\ntell menu \"Packages\"\nclick menu item \"Resolve Package Versions\"\nend tell\nend tell\nend tell\nend tell\nend tell\nend tell\nend tell\nend tell")
    }

}
