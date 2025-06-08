# SwiftUI Beginner's Guide: UI Fundamentals (Chapters 1-6)

This guide provides beginner-friendly solutions for SwiftUI UI fundamentals. Each concept is explained with simple examples and Python comparisons to help you understand.

**For Beginners**: These are the essential SwiftUI building blocks. Master these visual elements before moving to interactivity!

## Chapter 1: Introduction to SwiftUI

### Understanding SwiftUI's Philosophy (Beginner)

**Key Concept**: SwiftUI is declarative - you describe WHAT you want, not HOW to draw it.

```swift
// Python (Imperative)
# label = Label()
# label.text = "Hello"
# label.color = "blue"
# window.add(label)

// SwiftUI (Declarative)
Text("Hello")
    .foregroundColor(.blue)
```

**Beginner Explanation**: In Python, you create objects and set properties step by step. In SwiftUI, you declare what you want and chain modifiers.

## Chapter 2: Adding Text in SwiftUI

### Exercise 2.1: Basic Text Display (Solution)

```swift
import SwiftUI

struct TextBasicsView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Simple text
            Text("Hello, SwiftUI!")

            // Text with single modifier
            Text("Welcome to iOS Development")
                .font(.title)

            // Text with multiple modifiers
            Text("Learn SwiftUI")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
        }
    }
}

struct TextBasicsView_Previews: PreviewProvider {
    static var previews: some View {
        TextBasicsView()
    }
}
```

**What's Happening**:
- `Text()` creates a text view
- `.font()` changes the text size
- `.fontWeight()` makes text bold/light
- `.foregroundColor()` sets text color

### Exercise 2.2: Advanced Text Styling (Solution)

```swift
struct AdvancedTextView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Custom font size
            Text("Custom Size")
                .font(.system(size: 24))

            // Multiple line text
            Text("This is a longer text that will wrap to multiple lines when needed")
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .truncationMode(.tail)

            // Styled with multiple attributes
            Text("Fancy Text")
                .font(.title)
                .italic()
                .underline()
                .foregroundColor(.purple)
                .background(Color.yellow.opacity(0.3))
                .cornerRadius(10)
                .padding()
        }
        .padding()
    }
}

struct AdvancedTextView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedTextView()
    }
}
```

**Python Comparison**: Like using `configure()` in Tkinter, but cleaner:
```python
# Tkinter way
label.configure(font=("Arial", 24), fg="purple", bg="yellow")

# SwiftUI way - more readable!
Text("Fancy Text")
    .font(.system(size: 24))
    .foregroundColor(.purple)
    .background(Color.yellow)
```

### Exercise 2.3: Dynamic Text (Solution)

```swift
struct DynamicTextView: View {
    let userName = "SwiftUI Learner"
    let score = 42

    var body: some View {
        VStack(spacing: 20) {
            // String interpolation
            Text("Welcome, \(userName)!")
                .font(.title2)

            // Combining strings
            Text("Your score: \(score) points")
                .font(.headline)
                .foregroundColor(score > 40 ? .green : .red)

            // Multi-styled text
            Text("Learn ")
                .font(.body)
            + Text("SwiftUI")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            + Text(" Today!")
                .font(.body)
        }
    }
}

struct DynamicTextView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTextView()
    }
}
```

**Beginner Tip**: Use string interpolation `\(variable)` just like Python's f-strings!

## Chapter 3: Creating Shapes in SwiftUI

### Exercise 3.1: Basic Shapes (Solution)

```swift
struct BasicShapesView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Circle
            Circle()
                .fill(Color.red)
                .frame(width: 100, height: 100)

            // Rectangle
            Rectangle()
                .fill(Color.blue)
                .frame(width: 150, height: 80)

            // Rounded Rectangle
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .frame(width: 200, height: 100)

            // Ellipse
            Ellipse()
                .fill(Color.orange)
                .frame(width: 150, height: 80)

            // Capsule (Stadium shape)
            Capsule()
                .fill(Color.purple)
                .frame(width: 200, height: 60)
        }
    }
}

struct BasicShapesView_Previews: PreviewProvider {
    static var previews: some View {
        BasicShapesView()
    }
}
```

**Common Mistake**: Forgetting to set `.frame()` - shapes will expand to fill available space!

### Exercise 3.2: Shape Styling (Solution)

```swift
struct StyledShapesView: View {
    var body: some View {
        VStack(spacing: 40) {
            // Stroked circle
            Circle()
                .stroke(Color.blue, lineWidth: 5)
                .frame(width: 100, height: 100)

            // Filled with stroke
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.yellow)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 3)
                )
                .frame(width: 200, height: 100)

            // Shadow effect
            Circle()
                .fill(Color.red)
                .frame(width: 80, height: 80)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)

            // Gradient fill
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 200, height: 100)
                .cornerRadius(20)
        }
    }
}

struct StyledShapesView_Previews: PreviewProvider {
    static var previews: some View {
        StyledShapesView()
    }
}
```

**Python Comparison**:
```python
# In matplotlib/tkinter, you'd draw shapes procedurally
canvas.create_oval(50, 50, 150, 150, fill="red", outline="blue", width=5)

# In SwiftUI, you declare shape properties
Circle()
    .fill(Color.red)
    .overlay(Circle().stroke(Color.blue, lineWidth: 5))
```

## Chapter 4: Colors and Gradients

### Exercise 4.1: Working with Colors (Solution)

```swift
struct ColorsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // System colors
                HStack(spacing: 20) {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 80, height: 80)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 80, height: 80)
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 80, height: 80)
                }

                // Custom RGB colors
                Rectangle()
                    .fill(Color(red: 0.7, green: 0.3, blue: 0.8))
                    .frame(width: 250, height: 80)
                    .cornerRadius(10)

                // Semantic colors (adapt to dark mode)
                VStack(spacing: 10) {
                    Text("Primary Color")
                        .foregroundColor(.primary)
                    Text("Secondary Color")
                        .foregroundColor(.secondary)
                    Rectangle()
                        .fill(Color(.systemBackground))
                        .frame(width: 200, height: 60)
                        .overlay(
                            Text("System Background")
                        )
                }

                // Opacity
                HStack(spacing: 10) {
                    Rectangle()
                        .fill(Color.blue.opacity(0.3))
                        .frame(width: 80, height: 80)
                    Rectangle()
                        .fill(Color.blue.opacity(0.6))
                        .frame(width: 80, height: 80)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 80, height: 80)
                }
            }
            .padding()
        }
    }
}

struct ColorsView_Previews: PreviewProvider {
    static var previews: some View {
        ColorsView()
    }
}
```

**Beginner Tip**: Use semantic colors like `.primary`, `.secondary` for automatic dark mode support!

### Exercise 4.2: Gradient Mastery (Solution)

```swift
struct GradientView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                // Linear Gradient
                Text("Linear Gradients")
                    .font(.headline)

                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [.red, .orange, .yellow],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(height: 100)
                    .cornerRadius(20)

                // Radial Gradient
                Text("Radial Gradient")
                    .font(.headline)

                Circle()
                    .fill(
                        RadialGradient(
                            colors: [.white, .blue, .black],
                            center: .center,
                            startRadius: 5,
                            endRadius: 100
                        )
                    )
                    .frame(width: 200, height: 200)

                // Angular Gradient
                Text("Angular Gradient")
                    .font(.headline)

                Circle()
                    .fill(
                        AngularGradient(
                            colors: [.red, .yellow, .green, .blue, .purple, .red],
                            center: .center
                        )
                    )
                    .frame(width: 200, height: 200)

                // Gradient as background
                Text("Gradient Background")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [.purple, .pink],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .cornerRadius(20)
                    )
            }
            .padding()
        }
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
```

## Chapter 5: SF Symbols and System Icons

### Exercise 5.1: Using SF Symbols (Solution)

```swift
struct SFSymbolsView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Basic symbol
            Image(systemName: "star.fill")
                .font(.largeTitle)
                .foregroundColor(.yellow)

            // Symbol with text
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.blue)
                Text("Messages")
            }
            .font(.title2)

            // Customized symbols
            HStack(spacing: 30) {
                Image(systemName: "heart.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.red)

                Image(systemName: "bolt.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.yellow)
                    .rotationEffect(.degrees(15))

                Image(systemName: "cloud.rain.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.gray)
            }

            // Multi-color symbols
            Image(systemName: "battery.100")
                .font(.system(size: 40))
                .foregroundColor(.green)
                .symbolRenderingMode(.multicolor)

            // Symbol variants
            VStack(spacing: 20) {
                Image(systemName: "star")
                Image(systemName: "star.fill")
                Image(systemName: "star.circle")
                Image(systemName: "star.circle.fill")
            }
            .font(.largeTitle)
            .foregroundColor(.orange)
        }
    }
}

struct SFSymbolsView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolsView()
    }
}
```

**What's Happening**:
- `Image(systemName:)` creates a system icon
- `.font()` controls icon size
- `.foregroundColor()` sets icon color
- `.symbolRenderingMode()` controls multi-color behavior

**Python Comparison**: Like using Font Awesome in web development, but built into iOS

### Exercise 5.2: Creating Icon Buttons (Solution)

```swift
struct IconButtonsView: View {
    @State private var isLiked = false
    @State private var isBookmarked = false

    var body: some View {
        VStack(spacing: 40) {
            // Like button with animation
            Button(action: {
                isLiked.toggle()
            }) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .font(.system(size: 40))
                    .foregroundColor(isLiked ? .red : .gray)
                    .scaleEffect(isLiked ? 1.2 : 1.0)
                    .animation(.spring(), value: isLiked)
            }

            // Action toolbar
            HStack(spacing: 40) {
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                        .foregroundColor(.blue)
                }

                Button(action: {
                    isBookmarked.toggle()
                }) {
                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                        .font(.title)
                        .foregroundColor(isBookmarked ? .orange : .gray)
                }

                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct IconButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        IconButtonsView()
    }
}
```

**What's Happening**:
- `Button(action:)` creates an interactive button
- `@State` manages button state
- `.animation()` adds smooth transitions
- `.scaleEffect()` creates visual feedback

**Beginner Tip**: Use SF Symbols app to browse all 4,000+ icons!

## Chapter 6: Working with Images

### Exercise 6.1: Displaying Images (Solution)

```swift
struct ImagesView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // From SF Symbols
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .foregroundColor(.blue)

                // From Assets Catalog
                // Add an image named "profile" to Assets.xcassets first
                // Image("profile")
                //     .resizable()
                //     .scaledToFit()
                //     .frame(width: 200, height: 200)

                // Placeholder example
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 200, height: 200)
                    .overlay(
                        VStack {
                            Image(systemName: "person.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.gray)
                            Text("Profile Photo")
                                .foregroundColor(.gray)
                        }
                    )

                // Image modifiers
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 4)
                    )
                    .shadow(radius: 10)
            }
        }
    }
}

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesView()
    }
}
```

**What's Happening**:
- `Image()` loads images from assets or system
- `.resizable()` allows image resizing
- `.scaledToFit()` maintains aspect ratio
- `.clipShape()` creates custom shapes

**Python Comparison**: Like using PIL/Pillow for image manipulation, but with UI focus

### Exercise 6.2: Image Compositions (Solution)

```swift
struct ImageCompositionView: View {
    var body: some View {
        VStack(spacing: 40) {
            // Profile avatar with status
            ZStack(alignment: .bottomTrailing) {
                // Profile image
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 100, height: 100)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                    )

                // Status indicator
                Circle()
                    .fill(Color.green)
                    .frame(width: 30, height: 30)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 3)
                    )
            }

            // Image card
            VStack(alignment: .leading, spacing: 10) {
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(height: 200)
                    .overlay(
                        Image(systemName: "photo.on.rectangle")
                            .font(.system(size: 60))
                            .foregroundColor(.white.opacity(0.8))
                    )
                    .cornerRadius(20)

                Text("Beautiful Sunset")
                    .font(.headline)
                Text("Captured yesterday evening")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(20)
        }
        .padding()
    }
}

struct ImageCompositionView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCompositionView()
    }
}
```

**What's Happening**:
- `ZStack` layers views on top of each other
- `.overlay()` adds content on top of views
- `.alignment` controls overlay positioning
- `.opacity()` creates transparency effects

**Beginner Tip**: Always use `.resizable()` and `.scaledToFit()` or `.scaledToFill()` when working with images

## Mini-Project: Business Card View

**Goal**: Combine all UI fundamentals to create a professional business card

```swift
struct BusinessCardView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Header with gradient
            ZStack {
                LinearGradient(
                    colors: [.blue, .purple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )

                VStack {
                    // Profile image
                    Circle()
                        .fill(Color.white)
                        .frame(width: 120, height: 120)
                        .overlay(
                            Image(systemName: "person.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.gray)
                        )
                        .shadow(radius: 10)

                    Text("John Developer")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("iOS Developer")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.vertical, 40)
            }
            .frame(height: 250)

            // Contact information
            VStack(alignment: .leading, spacing: 20) {
                ContactRow(icon: "envelope.fill", text: "john@example.com", color: .blue)
                ContactRow(icon: "phone.fill", text: "+1 234 567 8900", color: .green)
                ContactRow(icon: "globe", text: "johndeveloper.com", color: .orange)
                ContactRow(icon: "location.fill", text: "San Francisco, CA", color: .red)
            }
            .padding(30)

            Spacer()
        }
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(radius: 20)
        .padding()
    }
}

struct ContactRow: View {
    let icon: String
    let text: String
    let color: Color

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(color)
                .frame(width: 30)

            Text(text)
                .font(.system(size: 16))

            Spacer()
        }
    }
}

struct BusinessCardView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCardView()
    }
}
```

## Common Mistakes and Solutions

1. **Forgetting `.resizable()` on images**
   ```swift
   // Wrong - image won't resize
   Image("photo").frame(width: 200, height: 200)

   // Correct
   Image("photo")
       .resizable()
       .scaledToFit()
       .frame(width: 200, height: 200)
   ```

2. **Using fixed colors instead of semantic colors**
   ```swift
   // Avoid
   .foregroundColor(Color(red: 0, green: 0, blue: 0))

   // Better - adapts to dark mode
   .foregroundColor(.primary)
   ```

3. **Not using proper spacing**
   ```swift
   // Hard to maintain
   Text("Hello").padding(.top, 20).padding(.bottom, 20)

   // Better
   Text("Hello").padding(.vertical, 20)
   ```

## Practice Challenges

### Challenge 1: Weather Card
Create a weather display showing:
- Temperature with gradient background
- Weather icon (SF Symbol)
- City name
- High/Low temperatures

### Challenge 2: Social Media Profile Header
Build a profile header with:
- Cover image gradient
- Profile picture with border
- Name and bio
- Follow/Message buttons

### Challenge 3: Product Card
Design a product card featuring:
- Product image placeholder
- Title and description
- Price with special formatting
- Add to cart button with icon

## Summary

You've learned the fundamental building blocks of SwiftUI:
- **Text**: Display and style information
- **Shapes**: Create geometric elements
- **Colors**: Use system and custom colors
- **Gradients**: Add visual depth
- **SF Symbols**: Professional icons
- **Images**: Display and manipulate images

These elements form the foundation of every SwiftUI app. Practice combining them creatively!

Next: Move on to `swiftui-ch7-13-solutions.md` to learn about layout and composition.
