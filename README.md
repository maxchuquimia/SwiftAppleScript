#  SwiftAppleScript

A tiny Apple Script DSL for Swift.

Not fully featured & a terrible idea... but helpful if you need branching logic when writing code that writes your Apple Scripts.

```swift
@AppleScript 
func switchToXcode(alsoBuild: Bool, showSuccessMessage: Bool): ScriptPart {
    Tell(application: "Xcode") {
        Activate()
    
        if alsoBuild {
            Tell(application: "System Events") {
                Keystroke("b", using: .command)
            }
        }
    }
    
    if showSuccessMessage {
        Tell(application: "System Events") {
            Display(dialog: "Done!")
        }
    }
}

...

try switchToXcode(alsoBuild: true).run()
```
