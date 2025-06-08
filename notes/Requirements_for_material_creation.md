# Requirements for Material creation

- refer to the material in the project "practise_apple_iosapp_swift_Basics", see the tree below for the material structure:

├── notes
│   ├── swift-beginner-summary.md
│   ├── swift-ch1-5-solutions.md
│   ├── swift-ch11-end-solutions.md
│   ├── swift-ch6-7-solutions.md
│   ├── swift-ch8-11-solutions.md
│   └── swift-practice-material.md

- the material was based on the youtube video series

```yaml
PLAYLIST - Swift Basics (Beginner Level) | YouTube

https://www.youtube.com/playlist?list=PLwvDm4VfkdpiLvzZFJI6rVIBtdolrJBVB

`proj apple iosapp learn`

- [x] 1. Learn Swift online for FREE | Swift Basics #0 - 2 mins
- [x] 2. How to code in Swift | Swift Basics #1 - 18 mins
- [x] 3. How to use basic Types in Swift (Bool, String, Int) | Swift Basics #2 - 16 mins
- [x] 4. How to use Variables and Constants | Swift Basics #3 - 12 mins
- [x] 5. How to write if-statements and use operators | Swift Basics #4 - 24 mins
- [x] 6. How to use Functions in Swift | Swift Basics #5 - 36 mins
- [x] 7. How to use Optionals in Swift | Swift Basics #6 - 53 mins
- [x] 8. How to use Tuples in Swift | Swift Basics #7 - 13 mins
- [x] 9. What is Object Oriented Programming for Swift | Swift Basics #8 - 40 mins
- [x] 10. How to use Structs in Swift | Swift Basics #9 - 30 mins
- [x] 11. How to use Enums in Swift | Swift Basics #10 - 15 mins
- [x] 12. How to use Classes in Swift | Swift Basics #11 - 15 mins
- [x] 13. How to use Access Control (Private vs Public) | Swift Basics #12 - 18 mins
- [x] 14. How to use Arrays and Sets in Swift | Swift Basics #13 - 29 mins
- [x] 15. How to use Dictionaries in Swift | Swift Basics #14 - 18 mins
- [x] 16. How to use For Loops in Swift | Swift Basics #15 - 16 mins
- [x] 17. How to Filter, Sort, and Map in Swift | Swift Basics #16 - 16 mins
- [x] 18. What is a Protocol in Swift and SwiftUI View protocol | Swift Basics #17 - 9 mins
- [ ] 19. Learn Swift online for FREE Series Conclusion | Swift Basics #18 - 3 mins
```

- here is some example of the material:

```yaml
# notes/swift-beginner-summary.md

# Swift Documentation Updates: Beginner-Focused Revisions

## Overview

The Swift documentation files have been comprehensively updated to focus on beginner learners, with particular attention to making concepts accessible to those coming from a Python background.

## Key Changes Made

### 1. **Language Simplification**

- Removed complex concurrency and actor examples
- Simplified async/await concepts to basic level
- Focused on fundamental Swift concepts first
- Used clear, jargon-free explanations

### 2. **Python Comparisons Added**

Throughout all documents, Swift concepts are now compared to Python equivalents:

- **Swift Optionals** ↔ **Python None handling**
- **Swift Structs** ↔ **Python dataclasses**
- **Swift Classes** ↔ **Python classes**
- **Swift Protocols** ↔ **Python Abstract Base Classes**
- **Swift Access Control** ↔ **Python naming conventions**

### 3. **Beginner-Friendly Examples**

- Replaced complex social media app with simple examples
- Used familiar concepts (animals, bank accounts, grade books)
- Added step-by-step explanations
- Included "What could go wrong" scenarios

### 4. **Structure Improvements**

- Clear section headers with difficulty indicators
- Consistent "Beginner Explanation" boxes
- Progressive complexity within each exercise
- Practical mini-projects at the end of each chapter

## Updated Files

### `swift-ch6-7-solutions.md`

**Focus**: Optionals and Tuples for beginners

- Basic optional handling with if-let and guard-let
- Simple error handling with do-catch
- Tuple usage for function returns
- Grade book mini-project

**Key Beginner Concepts:**

- Safe unwrapping vs force unwrapping
- Optional chaining with `?.`
- Nil coalescing with `??`
- Tuple destructuring and comparison

### `swift-ch8-11-solutions.md`

**Focus**: Structs and Classes fundamentals

- Value types vs reference types
- Basic struct creation and mutation
- Simple class inheritance
- Bank account and library system examples

**Key Beginner Concepts:**

- When to use structs vs classes
- `mutating` functions in structs
- Class initialization and inheritance
- Access control basics

### `swift-ch11-end-solutions.md`
...

notes/swift-ch1-5-solutions.md

# Swift Beginner's Guide: Fundamentals (Chapters 1-5)

This guide provides beginner-friendly solutions for Swift fundamentals. Each concept is explained with simple examples and Python comparisons to help you understand.

**For Beginners**: These are the essential Swift building blocks. Master these first before moving to advanced topics!

## Chapter 2: Basic Types in Swift

### Exercise 2.1: Type Declaration and Inference (Solution)

```swift
// Let Swift figure out the type (type inference)
let name = "Swift Learner"      // Swift knows this is a String
let age = 25                    // Swift knows this is an Int
let height = 5.8                // Swift knows this is a Double
let isStudent = true            // Swift knows this is a Bool

// You can also be explicit about types
let userName: String = "John"
let userAge: Int = 30
let weight: Double = 150.5
let isActive: Bool = false

// Print them out
print("Name: \(name)")
print("Age: \(age)")
print("Height: \(height)")
print("Is student: \(isStudent)")


notes/swift-practice-material.md

# Swift Learning Path: Beginner to Confident Developer

This learning path provides beginner-friendly practice exercises for each Swift concept. Each section builds on previous knowledge with simple, clear examples and Python comparisons.

## How to Use This Guide (For Beginners)

1. **Start with Xcode Playgrounds** - Perfect for experimenting with code
2. **Read the explanations first** - Don't jump straight to coding
3. **Try each exercise yourself** - Then check the solutions in the corresponding files
4. **Compare with Python** - Use your existing knowledge to understand Swift
5. **Practice daily** - Even 15 minutes a day makes a big difference

**For Python Developers**: This guide assumes you know Python basics and draws parallels between Swift and Python concepts.

**Files to Use Alongside This Guide:**

- `swift-ch1-5-solutions.md` - Detailed solutions for fundamentals
- `swift-ch6-7-solutions.md` - Optionals and tuples with examples
- `swift-ch8-11-solutions.md` - Structs and classes explained simply
- `swift-ch11-end-solutions.md` - Advanced classes and protocols

Let's begin your Swift journey!

## Chapter 2: Basic Types in Swift

### Exercise 2.1: Type Declaration and Inference (Beginner)

**Goal**: Learn how Swift handles types (similar to Python's type hints, but enforced)

```swift
// 1. Let Swift figure out types (like Python without type hints)
let name = "Swift Learner"     // Swift knows this is String
let age = 25                   // Swift knows this is Int

// 2. Be explicit about types (like Python with type hints)
let userName: String = "John"
let userAge: Int = 30

// 3. Practice string interpolation
let message = "Hello, \\(name)! You are \\(age) years old."
print(message)
```

**Python Comparison**: Like Python's `f"Hello, {name}!"` but with `\\()` instead of `{}`

### Exercise 2.2: Type Conversion (Beginner)

**Goal**: Learn safe type conversion (Swift is stricter than Python)
...
```

- YOUR TASK is to create a new material, refer the above material for idea, style, but with the following requirements:

- the material should be in the same format as the above material
- the material should be in the same language as the above material
- the material should be in the same style as the above material
- the material should be in the same structure as the above material
- the material should be in the same level as the above material
- the material should be placed in the notes folder
- remember that the material is for beginners, so the material should be easy to understand and follow
- the user has a python background, so the material should be easy to understand and follow
- you can refer the below project plan in creating the material as we need to create a new material for the project "practise_apple_iosapp_swift_UI"

```yaml
PLAYLIST - SwiftUI Bootcamp (Beginner Level) | YouTube

https://www.youtube.com/watch?v=-Yp0LS61Nxk&list=PLwvDm4VfkdphqETTBf-DdjCoAvhai1QpO

`proj apple iosapp swiftui`

- [x] 1. Learn SwiftUI online for FREE | Bootcamp #0 - 6:43
- [x] 2. How to use Xcode in SwiftUI project | Bootcamp #1 - 22:30
- [x] 3. Adding Text in SwiftUI | Bootcamp #2 - 16:43
- [x] 4. Creating Shapes in SwiftUI | Bootcamp #3 - 11:42
- [x] 5. Color, UIColor, Color Literals, and Hex Colors in SwiftUI | Bootcamp #4 - 16:48
- [x] 6. Linear, Radial, and Angular Gradients in SwiftUI | Bootcamp #5 - 11:56
- [x] 7. System Icons, Multi-Color Icons, and SF Symbols in SwiftUI | Bootcamp #6 - 11:54 -> start here
- [x] 8. Adding images to a SwiftUI application | Bootcamp #7 - 10:39
- [x] 9. Frames and Alignments in SwiftUI | Bootcamp #8 - 12:07
- [x] 10. Backgrounds and Overlays in SwiftUI | Bootcamp #9 - 18:20
- [x] 11. VStack, HStack, and ZStack in SwiftUI | Bootcamp #10 - 21:37
- [x] 12. Adding Padding in SwiftUI View | Bootcamp #11 - 11:33
- [x] 13. How to use Spacer in SwiftUI | Bootcamp #12 - 14:19
- [ ] 14. How to use inits and enums in SwiftUI | Bootcamp #13 - 19:30
- [ ] 15. How to use ForEach loops in SwiftUI | Bootcamp #14 - 13:30
- [ ] 16. Implementing a ScrollView in SwiftUI | Bootcamp #15 - 12:18
- [ ] 17. LazyVGrid, LazyHGrid, and GridItems in SwiftUI | Bootcamp #16 - 22:16
- [ ] 18. How to use and ignore the Safe Area in SwiftUI | Bootcamp #17 - 17:24
- [ ] 19. How to add Buttons to SwiftUI application | Bootcamp #18 - 12:48
- [ ] 20. How to use @State property wrapper in SwiftUI | Bootcamp #19 - 11:01
- [ ] 21. Extracting functions and subviews in SwiftUI | Bootcamp #20 - 11:20
- [ ] 22. How to Extract Subviews in SwiftUI | Bootcamp #21 - 11:19
- [ ] 23. How to use @Binding property wrapper in SwiftUI | Bootcamp #22 - 12:40
- [ ] 24. How to use if-else and conditional statements in SwiftUI | Bootcamp #23 - 18:13
- [ ] 25. How to use Ternary Operators in SwiftUI | Bootcamp #24 - 7:59
- [ ] 26. Adding Animations in SwiftUI | Bootcamp #25 - 14:01
- [ ] 27. Animation Curves and Animation Timing in SwiftUI | Bootcamp #26 - 12:51
- [ ] 28. How to use Transition in SwiftUI | Bootcamp #27 - 11:27
- [ ] 29. Display pop-up Sheets and FullScreenCovers in SwiftUI | Bootcamp #28 - 14:14
- [ ] 30. Using Sheets, Transitions, and Offsets to create a popover in SwiftUI | Bootcamp #29 - 13:02
- [ ] 31. How to use NavigationView and NavigationLink in SwiftUI | Bootcamp #30 - 16:46
- [ ] 32. Add, edit, move, and delete items in a List in SwiftUI | Bootcamp #31 - 27:29
- [ ] 33. How to show Alerts in SwiftUI app | Bootcamp #32 - 19:25
- [ ] 34. How to make a reusable ActionSheet in SwiftUI | Bootcamp #33 - 17:48
- [ ] 35. How to use ContextMenu in SwifUI | Bootcamp #34 - 9:39
- [ ] 36. How to use TextField in SwiftUI | Bootcamp #35 - 16:22
- [ ] 37. How to use TextEditor in SwiftUI | Bootcamp #36 - 9:48
- [ ] 38. How to use a Toggle to create a Switch in SwiftUI | Bootcamp #37 - 5:48
- [ ] 39. Picker and PickerStyles in SwiftUI | Bootcamp #38 - 19:56
- [ ] 40. How to use ColorPicker in SwiftUI | Bootcamp #39 - 6:05
- [ ] 41. How to use DatePicker to select dates in SwiftUI | Bootcamp #40 - 13:29
- [ ] 42. Create a Stepper in SwiftUI | Bootcamp #41 - 7:46
- [ ] 43. How to use Slider in SwiftUI | Bootcamp #42 - 10:45
- [ ] 44. Create a tab bar with TabView and PageTabViewStyle in SwiftUI | Bootcamp #43 - 16:27
- [ ] 45. Adapt for Dark Mode in SwiftUI project | Bootcamp #44 - 12:35
- [ ] 46. Adding markups and documentation to Swift in Xcode | Bootcamp #45 - 25:21
- [ ] 47. How to use onAppear and onDisappear in SwiftUI | Bootcamp #46 - 10:49
- [ ] 48. How to safely unwrap optionals in Swift with if-let and guard statements | Bootcamp #47 - 18:14
- [ ] 49. How to add a Tap Gesture in SwiftUI | Bootcamp #48 - 9:05
- [ ] 50. How to create custom models in SwiftUI | Bootcamp #49 - 18:13
- [ ] 51. How to use @ObservableObject and @StateObject in SwiftUI | Bootcamp #50 - 35:12
- [ ] 52. How to use @EnvironmentObject in SwiftUI | Bootcamp #51 - 26:48
- [ ] 53. How to use @AppStorage in SwiftUI | Bootcamp #52 - 17:08
- [ ] 54. Manage user onboarding with @AppStorage and Transitions in SwiftUI | Bootcamp #53 - 1:05:08
- [ ] 55. Async Image in iOS 15 for SwiftUI | Bootcamp #54 - 12:25
- [ ] 56. System Materials and Backgrounds in iOS 15 for SwiftUI | Bootcamp #55 - 6:37
- [ ] 57. How to select text with TextSelection in SwiftUI | Bootcamp #56 - 3:02
- [ ] 58. Button styles, border shapes, and control sizes in SwiftUI on iOS 15 | Bootcamp #57 - 11:02
- [ ] 59. Add custom List Swipe Actions in SwiftUI | Bootcamp #58 - 9:14
- [ ] 60. How to add Badges to SwiftUI TabView and List in iOS 15 | Bootcamp #59 - 5:04
- [ ] 61. How to use @FocusState in SwiftUI | Bootcamp #60 - 16:28
- [ ] 62. Customizing Keyboard submit button in SwiftUI | Bootcamp #61 - 5:28
- [ ] 63. How to use NavigationStack in SwiftUI | Bootcamp #62 - 23:59
- [ ] 64. How to use Toolbar in SwiftUI | Bootcamp #63 - 15:25
- [ ] 65. How to create resizable sheets in SwiftUI | Bootcamp #64 - 15:13
- [ ] 66. How to use SafeAreaInsets in SwiftUI | Bootcamp #65 - 6:27
- [ ] 67. How to use Group in SwiftUI | Bootcamp #66 - 4:05
- [ ] 68. How to use animation with value in SwiftUI (iOS 16+) | Bootcamp #67 - 10:55
- [ ] 69. How to use Menu in SwiftUI | Bootcamp #68 - 3:00
- [ ] 70. How to use Popover modifier in SwiftUI | Bootcamp #69 - 18:04
- [ ] 71. How to use AnyLayout in SwiftUI | Bootcamp #70 - 10:58
- [ ] 72. How to use ViewThatFits in SwiftUI | Bootcamp #71 - 7:01
- [ ] 73. How to use NavigationSplitView in SwiftUI | Bootcamp #72 - 25:36
- [ ] 74. How to use Grid in SwiftUI | Bootcamp #73 - 15:28
- [ ] 75. How to use ContentUnavailableView in SwiftUI | Bootcamp #74 - 6:29
- [ ] 76. How to use ControlGroup in SwiftUI | Bootcamp #75 - 5:57
- [ ] 77. How to use @Observable Macro in SwiftUI | Bootcamp #76 - 18:52
```
