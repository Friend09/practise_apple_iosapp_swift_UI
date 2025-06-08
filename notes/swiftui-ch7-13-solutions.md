# SwiftUI Beginner's Guide: Layout and Composition (Chapters 7-13)

This guide provides beginner-friendly solutions for SwiftUI layout and composition. Each concept builds on the UI fundamentals to create complex, responsive layouts.

**For Beginners**: Layout is how you arrange UI elements on screen. Master these concepts to build professional-looking apps!

## Chapter 8: Frames and Alignments

### Exercise 8.1: Understanding Frames (Solution)

```swift
import SwiftUI

struct FrameBasicsView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Default behavior - takes minimum space
            Text("No Frame")
                .background(Color.red.opacity(0.3))

            // Fixed frame
            Text("Fixed Frame")
                .frame(width: 200, height: 50)
                .background(Color.blue.opacity(0.3))

            // Flexible frame
            Text("Flexible Frame")
                .frame(maxWidth: .infinity, maxHeight: 100)
                .background(Color.green.opacity(0.3))

            // Min and max constraints
            Text("Constrained")
                .frame(minWidth: 100, maxWidth: 300, minHeight: 50, maxHeight: 100)
                .background(Color.purple.opacity(0.3))
        }
        .padding()
    }
}
```

**Python Comparison**:
```python
# In Tkinter
label.pack(width=200, height=50)  # Fixed size

# In SwiftUI
Text("Fixed Frame")
    .frame(width: 200, height: 50)  # More intuitive!
```

### Exercise 8.2: Frame Alignment (Solution)

```swift
struct FrameAlignmentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Alignment within frame
            Text("Top Leading")
                .frame(width: 200, height: 100, alignment: .topLeading)
                .background(Color.red.opacity(0.3))
                .border(Color.red)

            Text("Center")
                .frame(width: 200, height: 100, alignment: .center)
                .background(Color.blue.opacity(0.3))
                .border(Color.blue)

            Text("Bottom Trailing")
                .frame(width: 200, height: 100, alignment: .bottomTrailing)
                .background(Color.green.opacity(0.3))
                .border(Color.green)

            // Practical example: Card with aligned content
            VStack {
                Text("Card Title")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("Card content goes here...")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
        .padding()
    }
}
```

**Common Mistake**: Forgetting that `.frame()` creates a new container - the alignment parameter positions content within that container!

## Chapter 9: Backgrounds and Overlays

### Exercise 9.1: Background Basics (Solution)

```swift
struct BackgroundBasicsView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Simple color background
            Text("Color Background")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)

            // Shape as background
            Text("Shape Background")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.purple)
                )
                .foregroundColor(.white)

            // Gradient background
            Text("Gradient Background")
                .padding()
                .background(
                    LinearGradient(
                        colors: [.orange, .red],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .foregroundColor(.white)
                .cornerRadius(10)

            // Multiple backgrounds
            Text("Multiple Backgrounds")
                .padding()
                .background(Color.white)
                .padding()
                .background(Color.blue)
                .padding()
                .background(Color.red)
        }
    }
}
```

### Exercise 9.2: Overlay Techniques (Solution)

```swift
struct OverlayTechniquesView: View {
    var body: some View {
        VStack(spacing: 40) {
            // Badge overlay
            Image(systemName: "bell.fill")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .overlay(
                    Circle()
                        .fill(Color.red)
                        .frame(width: 20, height: 20)
                        .overlay(
                            Text("3")
                                .font(.caption)
                                .foregroundColor(.white)
                        )
                        .offset(x: 15, y: -15),
                    alignment: .topTrailing
                )

            // Card with overlay
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 200)
                .overlay(
                    VStack {
                        Image(systemName: "creditcard")
                            .font(.system(size: 50))
                            .foregroundColor(.white.opacity(0.8))
                        Text("Premium Card")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                )

            // Progress indicator overlay
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 10)
                .frame(width: 100, height: 100)
                .overlay(
                    Circle()
                        .trim(from: 0, to: 0.7)
                        .stroke(Color.green, lineWidth: 10)
                        .rotationEffect(.degrees(-90))
                )
                .overlay(
                    Text("70%")
                        .font(.title2)
                        .fontWeight(.bold)
                )
        }
        .padding()
    }
}
```

**Beginner Tip**: Think of backgrounds as layers behind your content, and overlays as layers on top!

## Chapter 10: VStack, HStack, and ZStack

### Exercise 10.1: Stack Fundamentals (Solution)

```swift
struct StackFundamentalsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // VStack - Vertical arrangement
                Text("VStack Example")
                    .font(.headline)

                VStack(spacing: 10) {
                    ForEach(1...3, id: \.self) { index in
                        Text("Item \(index)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(10)
                    }
                }

                Divider()

                // HStack - Horizontal arrangement
                Text("HStack Example")
                    .font(.headline)

                HStack(spacing: 10) {
                    ForEach(1...3, id: \.self) { index in
                        Text("\(index)")
                            .frame(width: 60, height: 60)
                            .background(Color.green.opacity(0.3))
                            .cornerRadius(10)
                    }
                }

                Divider()

                // ZStack - Layered arrangement
                Text("ZStack Example")
                    .font(.headline)

                ZStack {
                    Rectangle()
                        .fill(Color.purple.opacity(0.3))
                        .frame(width: 200, height: 200)

                    Circle()
                        .fill(Color.yellow.opacity(0.5))
                        .frame(width: 150, height: 150)

                    Text("Layered")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            .padding()
        }
    }
}
```

### Exercise 10.2: Stack Alignment and Spacing (Solution)

```swift
struct StackAlignmentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                // VStack alignments
                Text("VStack Alignments")
                    .font(.headline)

                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Leading")
                            .font(.caption)
                        Rectangle().fill(Color.red).frame(width: 80, height: 30)
                        Rectangle().fill(Color.red).frame(width: 120, height: 30)
                        Rectangle().fill(Color.red).frame(width: 60, height: 30)
                    }

                    VStack(alignment: .center, spacing: 5) {
                        Text("Center")
                            .font(.caption)
                        Rectangle().fill(Color.green).frame(width: 80, height: 30)
                        Rectangle().fill(Color.green).frame(width: 120, height: 30)
                        Rectangle().fill(Color.green).frame(width: 60, height: 30)
                    }

                    VStack(alignment: .trailing, spacing: 5) {
                        Text("Trailing")
                            .font(.caption)
                        Rectangle().fill(Color.blue).frame(width: 80, height: 30)
                        Rectangle().fill(Color.blue).frame(width: 120, height: 30)
                        Rectangle().fill(Color.blue).frame(width: 60, height: 30)
                    }
                }

                // HStack alignments
                Text("HStack Alignments")
                    .font(.headline)

                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        Text("Top").frame(height: 50)
                        Rectangle().fill(Color.orange).frame(width: 50, height: 100)
                        Rectangle().fill(Color.orange).frame(width: 50, height: 70)
                    }

                    HStack(alignment: .center) {
                        Text("Center").frame(height: 50)
                        Rectangle().fill(Color.purple).frame(width: 50, height: 100)
                        Rectangle().fill(Color.purple).frame(width: 50, height: 70)
                    }

                    HStack(alignment: .bottom) {
                        Text("Bottom").frame(height: 50)
                        Rectangle().fill(Color.pink).frame(width: 50, height: 100)
                        Rectangle().fill(Color.pink).frame(width: 50, height: 70)
                    }
                }
            }
            .padding()
        }
    }
}
```

**Python Comparison**:
```python
# Tkinter grid system
label1.grid(row=0, column=0)
label2.grid(row=1, column=0)

# SwiftUI is more intuitive
VStack {
    Label1()
    Label2()
}
```

### Exercise 10.3: Complex Layouts with Stacks (Solution)

```swift
struct ComplexLayoutView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Header
            HStack {
                VStack(alignment: .leading) {
                    Text("Dashboard")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Welcome back!")
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "person.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
            }
            .padding()

            // Stats cards
            HStack(spacing: 15) {
                StatCard(title: "Revenue", value: "$12.5K", color: .green)
                StatCard(title: "Orders", value: "284", color: .blue)
            }
            .padding(.horizontal)

            // Recent activity
            VStack(alignment: .leading, spacing: 15) {
                Text("Recent Activity")
                    .font(.headline)
                    .padding(.horizontal)

                VStack(spacing: 10) {
                    ActivityRow(icon: "cart.fill", title: "New Order", time: "2 min ago", color: .blue)
                    ActivityRow(icon: "person.badge.plus", title: "New Customer", time: "15 min ago", color: .green)
                    ActivityRow(icon: "star.fill", title: "New Review", time: "1 hour ago", color: .yellow)
                }
                .padding(.horizontal)
            }

            Spacer()
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(color.opacity(0.1))
        .cornerRadius(15)
    }
}

struct ActivityRow: View {
    let icon: String
    let title: String
    let time: String
    let color: Color

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
                .frame(width: 30)

            Text(title)
                .font(.subheadline)

            Spacer()

            Text(time)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
}
```

## Chapter 11: Padding in SwiftUI

### Exercise 11.1: Padding Basics (Solution)

```swift
struct PaddingBasicsView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Default padding (all sides)
            Text("Default Padding")
                .background(Color.yellow)
                .padding()
                .background(Color.blue.opacity(0.3))

            // Specific value padding
            Text("Custom Padding")
                .background(Color.yellow)
                .padding(30)
                .background(Color.green.opacity(0.3))

            // Edge-specific padding
            Text("Edge Specific")
                .background(Color.yellow)
                .padding(.horizontal, 40)
                .padding(.vertical, 10)
                .background(Color.purple.opacity(0.3))

            // Individual edges
            Text("Individual Edges")
                .background(Color.yellow)
                .padding(.top, 20)
                .padding(.leading, 40)
                .padding(.bottom, 10)
                .padding(.trailing, 5)
                .background(Color.orange.opacity(0.3))
        }
        .padding()
    }
}
```

### Exercise 11.2: Padding in Practice (Solution)

```swift
struct PaddingPracticeView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Card with proper padding
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Featured")
                        .font(.caption)
                        .fontWeight(.semibold)
                }

                Text("SwiftUI Padding")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Padding creates space around your content, making your UI more readable and visually appealing.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(3)

                Button("Learn More") {
                    // Action
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding(20) // Content padding
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray6))
            .cornerRadius(15)
            .padding(.horizontal) // Card margin

            // List items with consistent padding
            VStack(spacing: 0) {
                ForEach(["Home", "Profile", "Settings"], id: \.self) { item in
                    HStack {
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(item)
                        Spacer()
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal, 20)

                    if item != "Settings" {
                        Divider()
                            .padding(.leading, 20)
                    }
                }
            }
            .background(Color(.systemGray6))
            .cornerRadius(15)
            .padding(.horizontal)
        }
    }
}
```

**Beginner Tip**: Order matters! `.padding()` then `.background()` puts padding inside the background. Reverse for padding outside!

## Chapter 12: Using Spacer

### Exercise 12.1: Spacer Fundamentals (Solution)

```swift
struct SpacerFundamentalsView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Push content apart
            HStack {
                Text("Left")
                Spacer()
                Text("Right")
            }
            .padding()
            .background(Color.blue.opacity(0.2))

            // Center with spacers
            HStack {
                Spacer()
                Text("Centered")
                Spacer()
            }
            .padding()
            .background(Color.green.opacity(0.2))

            // Multiple spacers
            HStack {
                Text("1")
                Spacer()
                Text("2")
                Spacer()
                Text("3")
            }
            .padding()
            .background(Color.purple.opacity(0.2))

            // Fixed vs flexible spacer
            VStack {
                Text("Top")
                Spacer(minLength: 50)
                Text("Bottom with min spacing")
            }
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .background(Color.orange.opacity(0.2))
        }
        .padding()
    }
}
```

### Exercise 12.2: Spacer in Layouts (Solution)

```swift
struct SpacerLayoutsView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Navigation bar layout
            HStack {
                Button(action: {}) {
                    Image(systemName: "arrow.left")
                }

                Spacer()

                Text("Title")
                    .font(.headline)

                Spacer()

                Button(action: {}) {
                    Image(systemName: "ellipsis")
                }
            }
            .padding()
            .background(Color(.systemGray6))

            // Card layout with spacer
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Product Name")
                        .font(.headline)
                    Text("Description")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Text("$99")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemGray6))
            )

            // Social media style layout
            VStack(spacing: 15) {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 40))

                    VStack(alignment: .leading) {
                        Text("Username")
                            .fontWeight(.semibold)
                        Text("2 hours ago")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.secondary)
                    }
                }

                Text("This is a post content that might be quite long and wrap to multiple lines.")
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "heart")
                            Text("Like")
                        }
                    }

                    Spacer()

                    Button(action: {}) {
                        HStack {
                            Image(systemName: "bubble.right")
                            Text("Comment")
                        }
                    }

                    Spacer()

                    Button(action: {}) {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                            Text("Share")
                        }
                    }
                }
                .font(.caption)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(15)

            Spacer()
        }
        .padding()
    }
}
```

## Chapter 13: ScrollView Implementation

### Exercise 13.1: Basic ScrollView (Solution)

```swift
struct BasicScrollView: View {
    var body: some View {
        // Vertical ScrollView (default)
        ScrollView {
            VStack(spacing: 20) {
                ForEach(1...20, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue.opacity(0.3))
                        .frame(height: 100)
                        .overlay(
                            Text("Item \(index)")
                                .font(.title2)
                        )
                }
            }
            .padding()
        }
    }
}
```

### Exercise 13.2: Horizontal ScrollView (Solution)

```swift
struct HorizontalScrollView: View {
    let categories = ["All", "Technology", "Design", "Business", "Marketing", "Development"]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Categories")
                .font(.headline)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .fill(category == "All" ? Color.blue : Color.gray.opacity(0.2))
                            )
                            .foregroundColor(category == "All" ? .white : .primary)
                    }
                }
                .padding(.horizontal)
            }

            Text("Featured")
                .font(.headline)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(1...5, id: \.self) { index in
                        VStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(
                                    LinearGradient(
                                        colors: [.blue, .purple],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 250, height: 150)
                                .overlay(
                                    Image(systemName: "photo")
                                        .font(.system(size: 50))
                                        .foregroundColor(.white.opacity(0.5))
                                )

                            Text("Feature \(index)")
                                .font(.headline)
                            Text("Description here")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.horizontal)
            }

            Spacer()
        }
    }
}
```

### Exercise 13.3: Advanced ScrollView Techniques (Solution)

```swift
struct AdvancedScrollView: View {
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        VStack {
            // Header that changes with scroll
            Text("My Feed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.systemBackground))
                .opacity(scrollOffset < -20 ? 0 : 1)
                .animation(.easeInOut, value: scrollOffset)

            ScrollView {
                VStack(spacing: 20) {
                    // Parallax header
                    GeometryReader { geometry in
                        ZStack {
                            LinearGradient(
                                colors: [.purple, .blue],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )

                            VStack {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 60))
                                    .foregroundColor(.white)
                                Text("Welcome Back!")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(width: geometry.size.width, height: 200 + (geometry.frame(in: .global).minY > 0 ? geometry.frame(in: .global).minY : 0))
                        .offset(y: geometry.frame(in: .global).minY > 0 ? -geometry.frame(in: .global).minY : 0)
                    }
                    .frame(height: 200)

                    // Content
                    ForEach(1...10, id: \.self) { index in
                        PostCard(index: index)
                    }
                }
                .overlay(
                    GeometryReader { geo in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey.self, value: geo.frame(in: .named("scroll")).minY)
                    }
                )
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                scrollOffset = value
            }
        }
    }
}

struct PostCard: View {
    let index: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    Text("User \(index)")
                        .fontWeight(.semibold)
                    Text("2 hours ago")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }

            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 200)
                .overlay(
                    Image(systemName: "photo")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                )

            HStack {
                Button(action: {}) {
                    Image(systemName: "heart")
                }
                Button(action: {}) {
                    Image(systemName: "bubble.right")
                }
                Button(action: {}) {
                    Image(systemName: "paperplane")
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "bookmark")
                }
            }
            .font(.title3)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
```

## Mini-Project: Instagram-Style Profile Layout

**Goal**: Combine all layout concepts to create a social media profile

```swift
struct ProfileLayoutView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile header
                VStack(spacing: 15) {
                    // Profile picture and stats
                    HStack(spacing: 30) {
                        // Profile picture
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 80, height: 80)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.gray)
                            )

                        // Stats
                        HStack(spacing: 30) {
                            StatView(number: "128", label: "Posts")
                            StatView(number: "2.5K", label: "Followers")
                            StatView(number: "894", label: "Following")
                        }
                    }

                    // Profile info
                    VStack(alignment: .leading, spacing: 5) {
                        Text("John Developer")
                            .font(.headline)
                        Text("iOS Developer | SwiftUI Enthusiast")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("Building beautiful apps with SwiftUI 🚀")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // Action buttons
                    HStack(spacing: 10) {
                        Button(action: {}) {
                            Text("Follow")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }

                        Button(action: {}) {
                            Text("Message")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(Color(.systemGray5))
                                .foregroundColor(.primary)
                                .cornerRadius(8)
                        }

                        Button(action: {}) {
                            Image(systemName: "person.badge.plus")
                                .padding(8)
                                .background(Color(.systemGray5))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding()

                Divider()

                // Tab bar
                HStack {
                    Image(systemName: "square.grid.3x3")
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "play.rectangle")
                        .foregroundColor(.secondary)
                    Spacer()
                    Image(systemName: "person.crop.square")
                        .foregroundColor(.secondary)
                }
                .font(.title2)
                .padding(.horizontal, 50)

                // Photo grid
                LazyVGrid(columns: columns, spacing: 2) {
                    ForEach(1...12, id: \.self) { index in
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(
                                Image(systemName: "photo")
                                    .font(.title)
                                    .foregroundColor(.gray)
                            )
                    }
                }
                .padding(.horizontal, 2)
            }
        }
    }
}

struct StatView: View {
    let number: String
    let label: String

    var body: some View {
        VStack(spacing: 3) {
            Text(number)
                .font(.headline)
                .fontWeight(.semibold)
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}
```

## Common Layout Mistakes and Solutions

1. **Spacer in ScrollView**
   ```swift
   // Wrong - Spacer doesn't work in ScrollView
   ScrollView {
       Text("Top")
       Spacer()  // This won't push content
       Text("Bottom")
   }

   // Correct - Use frame or padding
   ScrollView {
       VStack {
           Text("Top")
           Color.clear.frame(height: 200)
           Text("Bottom")
       }
   }
   ```

2. **Frame before modifiers**
   ```swift
   // Wrong - frame is applied before background
   Text("Hello")
       .frame(width: 100, height: 50)
       .background(Color.blue)  // Only text has background

   // Correct - frame after modifiers
   Text("Hello")
       .background(Color.blue)
       .frame(width: 100, height: 50)  // Entire frame has background
   ```

3. **Missing alignment in stacks**
   ```swift
   // Problem - items centered by default
   VStack {
       Text("Short")
       Text("This is a longer text")
   }

   // Solution - specify alignment
   VStack(alignment: .leading) {
       Text("Short")
       Text("This is a longer text")
   }
   ```

## Practice Challenges

### Challenge 1: Weather Dashboard
Create a weather app layout with:
- Scrollable daily forecast (horizontal)
- Current conditions card
- Weekly forecast list
- Proper spacing and alignment

### Challenge 2: Settings Screen
Build a settings screen featuring:
- Grouped sections with headers
- Toggle switches aligned properly
- Navigation-style rows
- Profile section at top

### Challenge 3: Photo Gallery
Design a photo gallery with:
- Grid layout (3 columns)
- Header with user info
- Tab bar for different views
- Smooth scrolling

## Summary

You've mastered SwiftUI layout fundamentals:
- **Frames**: Control size and alignment
- **Backgrounds/Overlays**: Layer your views
- **Stacks**: Arrange views vertically, horizontally, or in layers
- **Padding**: Create space around content
- **Spacer**: Push content apart
- **ScrollView**: Handle content larger than screen

These concepts are the foundation of every SwiftUI layout. Practice combining them to create complex, professional interfaces!

Next: Move on to `swiftui-ch14-24-solutions.md` to learn about state and interactivity.
