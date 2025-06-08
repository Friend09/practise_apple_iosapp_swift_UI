# SwiftUI Beginner's Guide: State and Interactivity (Chapters 14-24)

This guide provides beginner-friendly solutions for SwiftUI state management and interactivity. Learn how to make your UI respond to user input and manage data flow.

**For Beginners**: State is how your app remembers things. Master these concepts to create dynamic, interactive apps!

## Chapter 14: Using Initializers and Enums

### Exercise 14.1: Custom Initializers (Solution)

```swift
import SwiftUI

// Define an enum for different card types
enum CardType {
    case standard
    case premium
    case platinum

    var color: Color {
        switch self {
        case .standard:
            return .gray
        case .premium:
            return .blue
        case .platinum:
            return .purple
        }
    }

    var title: String {
        switch self {
        case .standard:
            return "Standard"
        case .premium:
            return "Premium"
        case .platinum:
            return "Platinum"
        }
    }
}

struct CardView: View {
    let type: CardType
    let userName: String

    // Custom initializer
    init(type: CardType = .standard, userName: String) {
        self.type = type
        self.userName = userName
    }

    var body: some View {
        VStack {
            Text(type.title)
                .font(.headline)
                .foregroundColor(.white)

            Text(userName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 300, height: 180)
        .background(
            LinearGradient(
                colors: [type.color, type.color.opacity(0.7)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
    }
}

// Usage
struct InitializerExampleView: View {
    var body: some View {
        VStack(spacing: 20) {
            CardView(userName: "John Doe")  // Uses default .standard
            CardView(type: .premium, userName: "Jane Smith")
            CardView(type: .platinum, userName: "Bob Wilson")
        }
    }
}
```

**Python Comparison**:
```python
# Python enum and init
from enum import Enum

class CardType(Enum):
    STANDARD = "standard"
    PREMIUM = "premium"

class Card:
    def __init__(self, card_type=CardType.STANDARD, user_name):
        self.card_type = card_type
        self.user_name = user_name
```

### Exercise 14.2: Enums with Associated Values (Solution)

```swift
// Weather condition enum with associated values
enum Weather {
    case sunny
    case cloudy(coverage: Int)  // 0-100%
    case rainy(amount: Double)  // mm of rain
    case snowy(depth: Double)   // cm of snow

    var icon: String {
        switch self {
        case .sunny:
            return "sun.max.fill"
        case .cloudy:
            return "cloud.fill"
        case .rainy:
            return "cloud.rain.fill"
        case .snowy:
            return "cloud.snow.fill"
        }
    }

    var description: String {
        switch self {
        case .sunny:
            return "Sunny"
        case .cloudy(let coverage):
            return "\(coverage)% Cloudy"
        case .rainy(let amount):
            return "\(amount)mm Rain"
        case .snowy(let depth):
            return "\(depth)cm Snow"
        }
    }
}

struct WeatherView: View {
    let weather: Weather

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: weather.icon)
                .font(.system(size: 50))
                .foregroundColor(.blue)

            Text(weather.description)
                .font(.title2)
                .fontWeight(.semibold)
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(15)
    }
}

struct WeatherExampleView: View {
    var body: some View {
        VStack(spacing: 20) {
            WeatherView(weather: .sunny)
            WeatherView(weather: .cloudy(coverage: 70))
            WeatherView(weather: .rainy(amount: 5.5))
            WeatherView(weather: .snowy(depth: 15.0))
        }
        .padding()
    }
}
```

## Chapter 15: ForEach Loops in SwiftUI

### Exercise 15.1: Basic ForEach (Solution)

```swift
struct ForEachBasicsView: View {
    let fruits = ["Apple", "Banana", "Orange", "Mango", "Strawberry"]
    let numbers = 1...5

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // ForEach with array
                Text("Fruits")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 10) {
                    ForEach(fruits, id: \.self) { fruit in
                        HStack {
                            Image(systemName: "leaf.fill")
                                .foregroundColor(.green)
                            Text(fruit)
                        }
                        .padding(.horizontal)
                    }
                }

                Divider()

                // ForEach with range
                Text("Numbers")
                    .font(.headline)

                HStack(spacing: 15) {
                    ForEach(numbers, id: \.self) { number in
                        Text("\(number)")
                            .frame(width: 50, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                Divider()

                // ForEach with indices
                Text("With Index")
                    .font(.headline)

                VStack(alignment: .leading) {
                    ForEach(Array(fruits.enumerated()), id: \.offset) { index, fruit in
                        HStack {
                            Text("\(index + 1).")
                                .fontWeight(.bold)
                                .frame(width: 30)
                            Text(fruit)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding()
        }
    }
}
```

### Exercise 15.2: ForEach with Custom Data (Solution)

```swift
// Data model
struct Task: Identifiable {
    let id = UUID()
    let title: String
    let isCompleted: Bool
    let priority: Priority

    enum Priority {
        case low, medium, high

        var color: Color {
            switch self {
            case .low: return .green
            case .medium: return .orange
            case .high: return .red
            }
        }
    }
}

struct TaskListView: View {
    let tasks = [
        Task(title: "Complete SwiftUI tutorial", isCompleted: false, priority: .high),
        Task(title: "Review pull requests", isCompleted: true, priority: .medium),
        Task(title: "Update documentation", isCompleted: false, priority: .low),
        Task(title: "Fix bug #123", isCompleted: false, priority: .high),
        Task(title: "Team meeting", isCompleted: true, priority: .medium)
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isCompleted ? .green : .gray)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(task.title)
                                .strikethrough(task.isCompleted)

                            Text(task.priority == .high ? "High Priority" :
                                 task.priority == .medium ? "Medium Priority" : "Low Priority")
                                .font(.caption)
                                .foregroundColor(task.priority.color)
                        }

                        Spacer()

                        Circle()
                            .fill(task.priority.color)
                            .frame(width: 10, height: 10)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("My Tasks")
        }
    }
}
```

**Beginner Tip**: Always use `Identifiable` protocol or provide `id` parameter in ForEach for dynamic content!

## Chapter 17: LazyVGrid and LazyHGrid

### Exercise 17.1: Grid Layouts (Solution)

```swift
struct GridLayoutView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 80))
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Fixed columns grid
                Text("Fixed 3-Column Grid")
                    .font(.headline)

                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(1...12, id: \.self) { item in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue.opacity(0.3))
                            .frame(height: 80)
                            .overlay(
                                Text("\(item)")
                                    .font(.title2)
                            )
                    }
                }
                .padding()

                Divider()

                // Adaptive grid
                Text("Adaptive Grid")
                    .font(.headline)

                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(1...15, id: \.self) { item in
                        Circle()
                            .fill(Color.green.opacity(0.3))
                            .frame(height: 80)
                            .overlay(
                                Text("\(item)")
                                    .font(.title3)
                            )
                    }
                }
                .padding()
            }
        }
    }
}
```

### Exercise 17.2: Horizontal Grid (Solution)

```swift
struct HorizontalGridView: View {
    let rows = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 20) {
                ForEach(1...20, id: \.self) { item in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(
                            LinearGradient(
                                colors: [.purple, .blue],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 150)
                        .overlay(
                            VStack {
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                Text("Item \(item)")
                                    .foregroundColor(.white)
                            }
                        )
                }
            }
            .padding()
        }
    }
}
```

## Chapter 18: Safe Area in SwiftUI

### Exercise 18.1: Understanding Safe Area (Solution)

```swift
struct SafeAreaView: View {
    var body: some View {
        ZStack {
            // Background that ignores safe area
            LinearGradient(
                colors: [.blue, .purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            // Content that respects safe area
            VStack {
                Text("Safe Area Example")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Spacer()

                // Button at bottom
                Button("Continue") {
                    // Action
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .foregroundColor(.blue)
                .cornerRadius(15)
                .padding()
            }
        }
    }
}
```

### Exercise 18.2: Selective Safe Area (Solution)

```swift
struct SelectiveSafeAreaView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // Header that extends into safe area
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 300)
                        .overlay(
                            Image(systemName: "photo")
                                .font(.system(size: 100))
                                .foregroundColor(.white.opacity(0.7))
                        )
                        .ignoresSafeArea(edges: .top)

                    // Content
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Beautiful Photo")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("This content respects the safe area while the image above extends beyond it.")
                            .foregroundColor(.secondary)

                        ForEach(1...5, id: \.self) { index in
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("Feature \(index)")
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                        }
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
```

## Chapter 19: Buttons in SwiftUI

### Exercise 19.1: Basic Buttons (Solution)

```swift
struct ButtonsView: View {
    @State private var tapCount = 0

    var body: some View {
        VStack(spacing: 30) {
            // Simple button
            Button("Tap Me") {
                tapCount += 1
            }

            Text("Tapped \(tapCount) times")

            // Button with custom label
            Button(action: {
                print("Custom button tapped")
            }) {
                HStack {
                    Image(systemName: "star.fill")
                    Text("Favorite")
                }
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
                .cornerRadius(10)
            }

            // Multiple button styles
            VStack(spacing: 20) {
                Button("Default Style") { }
                    .buttonStyle(.automatic)

                Button("Bordered") { }
                    .buttonStyle(.bordered)

                Button("Prominent") { }
                    .buttonStyle(.borderedProminent)

                Button("Plain") { }
                    .buttonStyle(.plain)
            }
        }
        .padding()
    }
}
```

### Exercise 19.2: Custom Button Styles (Solution)

```swift
struct CustomButtonView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Gradient button
            Button(action: {}) {
                Text("Gradient Button")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(25)
            }

            // Neumorphic button
            Button(action: {}) {
                Text("Soft Button")
                    .fontWeight(.medium)
                    .frame(width: 200, height: 50)
                    .background(Color(.systemGray5))
                    .cornerRadius(25)
                    .shadow(color: .white, radius: 3, x: -3, y: -3)
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 3, y: 3)
            }

            // Icon button with animation
            Button(action: {}) {
                Image(systemName: "heart.fill")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .scaleEffect(1.2)
                    .animation(.easeInOut(duration: 0.2), value: UUID())
            }
        }
    }
}
```

## Chapter 20: @State Property Wrapper

### Exercise 20.1: Understanding @State (Solution)

```swift
struct StateBasicsView: View {
    // @State variables - SwiftUI watches these for changes
    @State private var counter = 0
    @State private var name = ""
    @State private var isOn = false
    @State private var sliderValue = 50.0

    var body: some View {
        VStack(spacing: 30) {
            // Counter example
            VStack {
                Text("Counter: \(counter)")
                    .font(.largeTitle)

                HStack(spacing: 20) {
                    Button("Decrease") {
                        counter -= 1
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)

                    Button("Increase") {
                        counter += 1
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                }
            }

            Divider()

            // Text input
            VStack(alignment: .leading) {
                Text("Your name: \(name.isEmpty ? "Not set" : name)")
                TextField("Enter your name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }

            Divider()

            // Toggle
            HStack {
                Text("Dark Mode")
                Spacer()
                Toggle("", isOn: $isOn)
                    .labelsHidden()
            }
            .padding(.horizontal)

            Divider()

            // Slider
            VStack {
                Text("Volume: \(Int(sliderValue))%")
                Slider(value: $sliderValue, in: 0...100)
                    .padding(.horizontal)
            }
        }
        .padding()
    }
}
```

**Python Comparison**:
```python
# Python class with state
class MyView:
    def __init__(self):
        self.counter = 0  # Like @State
        self.name = ""

    def increase_counter(self):
        self.counter += 1
        self.update_ui()  # Manual update needed

# SwiftUI automatically updates when @State changes!
```

## Chapter 21-22: Extracting Subviews

### Exercise 21.1: Breaking Down Complex Views (Solution)

```swift
// Before extraction - everything in one view
struct MessyView: View {
    @State private var tasks = ["Task 1", "Task 2", "Task 3"]

    var body: some View {
        VStack {
            // This could be extracted
            HStack {
                Text("My Tasks")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Text("\(tasks.count)")
                    .font(.title)
                    .foregroundColor(.secondary)
            }
            .padding()

            // This could be extracted
            ForEach(tasks, id: \.self) { task in
                HStack {
                    Image(systemName: "circle")
                    Text(task)
                    Spacer()
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
            }

            Spacer()
        }
    }
}

// After extraction - clean and reusable
struct CleanView: View {
    @State private var tasks = ["Task 1", "Task 2", "Task 3"]

    var body: some View {
        VStack {
            HeaderView(title: "My Tasks", count: tasks.count)

            ForEach(tasks, id: \.self) { task in
                TaskRowView(taskName: task)
            }

            Spacer()
        }
    }
}

// Extracted subviews
struct HeaderView: View {
    let title: String
    let count: Int

    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Text("\(count)")
                .font(.title)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct TaskRowView: View {
    let taskName: String

    var body: some View {
        HStack {
            Image(systemName: "circle")
            Text(taskName)
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
```

**Beginner Tip**: Extract views when:
- Code gets too long (>50 lines)
- You repeat similar code
- You want to reuse components
- You need better organization

## Chapter 23: @Binding Property Wrapper

### Exercise 23.1: Parent-Child Communication (Solution)

```swift
// Parent view with @State
struct ParentView: View {
    @State private var isOn = false
    @State private var sliderValue = 0.5

    var body: some View {
        VStack(spacing: 30) {
            Text("Parent View")
                .font(.largeTitle)

            Text("Toggle is: \(isOn ? "ON" : "OFF")")
            Text("Slider: \(Int(sliderValue * 100))%")

            Divider()

            // Pass @State as @Binding to child
            ChildView(isOn: $isOn, value: $sliderValue)
        }
        .padding()
    }
}

// Child view with @Binding
struct ChildView: View {
    @Binding var isOn: Bool
    @Binding var value: Double

    var body: some View {
        VStack(spacing: 20) {
            Text("Child View")
                .font(.headline)

            Toggle("Toggle Switch", isOn: $isOn)

            Slider(value: $value)

            Button("Reset") {
                isOn = false
                value = 0.5
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
    }
}
```

### Exercise 23.2: Custom Binding (Solution)

```swift
struct CustomBindingView: View {
    @State private var celsius: Double = 0

    var fahrenheit: Binding<Double> {
        Binding(
            get: { celsius * 9/5 + 32 },
            set: { celsius = ($0 - 32) * 5/9 }
        )
    }

    var body: some View {
        VStack(spacing: 30) {
            Text("Temperature Converter")
                .font(.largeTitle)

            VStack(alignment: .leading) {
                Text("Celsius: \(celsius, specifier: "%.1f")°C")
                Slider(value: $celsius, in: -50...50)
            }

            VStack(alignment: .leading) {
                Text("Fahrenheit: \(fahrenheit.wrappedValue, specifier: "%.1f")°F")
                Slider(value: fahrenheit, in: -58...122)
            }
        }
        .padding()
    }
}
```

## Chapter 24: Conditional Statements

### Exercise 24.1: If-Else in Views (Solution)

```swift
struct ConditionalView: View {
    @State private var showDetails = false
    @State private var score = 75
    @State private var userRole = "guest"

    var body: some View {
        VStack(spacing: 20) {
            // Simple if statement
            if showDetails {
                Text("These are the details!")
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
            }

            Button("Toggle Details") {
                showDetails.toggle()
            }

            Divider()

            // If-else with condition
            if score >= 80 {
                Label("Excellent!", systemImage: "star.fill")
                    .foregroundColor(.green)
            } else if score >= 60 {
                Label("Good job!", systemImage: "hand.thumbsup.fill")
                    .foregroundColor(.orange)
            } else {
                Label("Keep trying!", systemImage: "arrow.up.circle.fill")
                    .foregroundColor(.red)
            }

            Slider(value: Binding(
                get: { Double(score) },
                set: { score = Int($0) }
            ), in: 0...100)

            Divider()

            // Conditional modifiers
            Text("User: \(userRole)")
                .padding()
                .background(userRole == "admin" ? Color.red : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

            Picker("Role", selection: $userRole) {
                Text("Guest").tag("guest")
                Text("User").tag("user")
                Text("Admin").tag("admin")
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()
    }
}
```

### Exercise 24.2: Ternary Operators (Solution)

```swift
struct TernaryOperatorView: View {
    @State private var isLiked = false
    @State private var count = 0
    @State private var isDarkMode = false

    var body: some View {
        VStack(spacing: 30) {
            // Ternary in image names
            Button(action: { isLiked.toggle() }) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .font(.largeTitle)
                    .foregroundColor(isLiked ? .red : .gray)
            }

            // Ternary in text
            Text("You have \(count) \(count == 1 ? "item" : "items")")

            HStack {
                Button("-") { count -= 1 }
                    .disabled(count <= 0)
                Button("+") { count += 1 }
            }

            // Multiple ternary operators
            Rectangle()
                .fill(isDarkMode ? Color.black : Color.white)
                .frame(height: 100)
                .overlay(
                    Text(isDarkMode ? "Dark Mode" : "Light Mode")
                        .foregroundColor(isDarkMode ? .white : .black)
                )
                .border(isDarkMode ? Color.white : Color.black, width: 2)

            Toggle("Dark Mode", isOn: $isDarkMode)
        }
        .padding()
    }
}
```

## Mini-Project: Interactive Form

**Goal**: Combine all state management concepts

```swift
struct InteractiveFormApp: View {
    @State private var formData = FormData()
    @State private var showSummary = false

    var body: some View {
        NavigationView {
            VStack {
                FormView(formData: $formData)

                Button("Submit") {
                    showSummary = true
                }
                .buttonStyle(.borderedProminent)
                .disabled(!formData.isValid)
            }
            .padding()
            .navigationTitle("Registration")
            .sheet(isPresented: $showSummary) {
                SummaryView(formData: formData)
            }
        }
    }
}

struct FormData {
    var firstName = ""
    var lastName = ""
    var email = ""
    var agreeToTerms = false
    var selectedPlan = "Basic"
    var notifications = true

    var isValid: Bool {
        !firstName.isEmpty &&
        !lastName.isEmpty &&
        !email.isEmpty &&
        agreeToTerms
    }
}

struct FormView: View {
    @Binding var formData: FormData

    var body: some View {
        Form {
            Section("Personal Information") {
                TextField("First Name", text: $formData.firstName)
                TextField("Last Name", text: $formData.lastName)
                TextField("Email", text: $formData.email)
                    .keyboardType(.emailAddress)
            }

            Section("Preferences") {
                Picker("Plan", selection: $formData.selectedPlan) {
                    Text("Basic").tag("Basic")
                    Text("Pro").tag("Pro")
                    Text("Premium").tag("Premium")
                }

                Toggle("Email Notifications", isOn: $formData.notifications)
            }

            Section {
                Toggle("I agree to terms", isOn: $formData.agreeToTerms)
            }
        }
    }
}

struct SummaryView: View {
    let formData: FormData
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Registration Summary")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                GroupBox("Personal Info") {
                    Label("\(formData.firstName) \(formData.lastName)",
                          systemImage: "person.fill")
                    Label(formData.email,
                          systemImage: "envelope.fill")
                }

                GroupBox("Selected Plan") {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(formData.selectedPlan)
                            .fontWeight(.semibold)
                    }
                }

                if formData.notifications {
                    Label("Email notifications enabled",
                          systemImage: "bell.fill")
                        .foregroundColor(.green)
                }

                Spacer()
            }
            .padding()
            .navigationBarItems(trailing: Button("Done") { dismiss() })
        }
    }
}
```

## Common State Management Mistakes

1. **Forgetting $ for bindings**
   ```swift
   // Wrong
   TextField("Name", text: name)

   // Correct
   TextField("Name", text: $name)
   ```

2. **Using @State in child views**
   ```swift
   // Wrong - child shouldn't own the state
   struct ChildView: View {
       @State var value: String  // Should be @Binding
   }

   // Correct
   struct ChildView: View {
       @Binding var value: String
   }
   ```

3. **Not marking @State as private**
   ```swift
   // Wrong
   @State var count = 0

   // Correct
   @State private var count = 0
   ```

## Practice Challenges

### Challenge 1: Temperature Converter
Create an app with:
- Input for Celsius/Fahrenheit/Kelvin
- Live conversion between all three
- Visual thermometer display
- History of conversions

### Challenge 2: Todo List
Build a todo app with:
- Add/edit/delete tasks
- Mark as complete
- Filter by status
- Persist data with @AppStorage

### Challenge 3: Quiz Game
Design a quiz with:
- Multiple choice questions
- Score tracking
- Timer for each question
- Results summary

## Summary

You've learned essential state management in SwiftUI:
- **Enums and Initializers**: Organize your data types
- **ForEach**: Display dynamic lists efficiently
- **@State**: Manage local view state
- **Extracting Views**: Keep code clean and reusable
- **@Binding**: Share state between views
- **Conditionals**: Create dynamic UIs

These concepts enable you to build truly interactive apps!

Next: Move on to `swiftui-ch25-49-solutions.md` for animations and advanced UI.
