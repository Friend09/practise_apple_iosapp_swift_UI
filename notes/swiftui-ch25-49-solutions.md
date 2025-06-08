# SwiftUI Beginner's Guide: Animations and Advanced UI (Chapters 25-49)

This guide provides beginner-friendly solutions for SwiftUI animations, navigation, forms, and advanced UI components. Master these to create professional, polished apps.

**For Beginners**: Animations make your app feel alive! Start simple and build up to complex transitions.

## Chapter 25: Adding Animations in SwiftUI

### Exercise 25.1: Basic Animations (Solution)

```swift
import SwiftUI

struct BasicAnimationView: View {
    @State private var isExpanded = false
    @State private var isRotated = false
    @State private var isScaled = false

    var body: some View {
        VStack(spacing: 40) {
            // Implicit animation
            Circle()
                .fill(isExpanded ? Color.blue : Color.red)
                .frame(width: isExpanded ? 200 : 100,
                       height: isExpanded ? 200 : 100)
                .animation(.easeInOut(duration: 1), value: isExpanded)
                .onTapGesture {
                    isExpanded.toggle()
                }

            // Rotation animation
            Image(systemName: "arrow.right.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.green)
                .rotationEffect(.degrees(isRotated ? 360 : 0))
                .animation(.spring(), value: isRotated)
                .onTapGesture {
                    isRotated.toggle()
                }

            // Scale animation
            Button("Tap Me") {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                    isScaled.toggle()
                }
            }
            .scaleEffect(isScaled ? 1.5 : 1.0)
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}
```

**Python Comparison**:
```python
# In Python (matplotlib/tkinter), animations are more complex
# SwiftUI makes it simple with .animation() modifier
```

### Exercise 25.2: Animating Multiple Properties (Solution)

```swift
struct MultiPropertyAnimationView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: showDetails ? 50 : 10)
                .fill(showDetails ? Color.purple : Color.blue)
                .frame(width: showDetails ? 300 : 150,
                       height: showDetails ? 300 : 150)
                .overlay(
                    VStack {
                        Image(systemName: showDetails ? "star.fill" : "star")
                            .font(.system(size: showDetails ? 80 : 40))
                            .foregroundColor(.white)

                        if showDetails {
                            Text("Details View")
                                .foregroundColor(.white)
                                .transition(.scale.combined(with: .opacity))
                        }
                    }
                )
                .animation(.spring(response: 0.6, dampingFraction: 0.8),
                          value: showDetails)

            Button(showDetails ? "Hide" : "Show") {
                showDetails.toggle()
            }
            .padding()
        }
    }
}
```

## Chapter 26: Animation Curves and Timing

### Exercise 26.1: Different Animation Types (Solution)

```swift
struct AnimationCurvesView: View {
    @State private var offset: CGFloat = -200

    var body: some View {
        VStack(spacing: 20) {
            // Linear animation
            AnimatedCircle(
                color: .red,
                offset: offset,
                animation: .linear(duration: 2),
                label: "Linear"
            )

            // Ease In Out
            AnimatedCircle(
                color: .blue,
                offset: offset,
                animation: .easeInOut(duration: 2),
                label: "Ease In Out"
            )

            // Spring
            AnimatedCircle(
                color: .green,
                offset: offset,
                animation: .spring(response: 1, dampingFraction: 0.5),
                label: "Spring"
            )

            // Custom timing
            AnimatedCircle(
                color: .purple,
                offset: offset,
                animation: .timingCurve(0.68, -0.55, 0.265, 1.55, duration: 2),
                label: "Custom"
            )

            Spacer()

            Button("Animate") {
                offset = offset == -200 ? 200 : -200
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct AnimatedCircle: View {
    let color: Color
    let offset: CGFloat
    let animation: Animation
    let label: String

    var body: some View {
        HStack {
            Text(label)
                .frame(width: 100, alignment: .leading)

            Circle()
                .fill(color)
                .frame(width: 40, height: 40)
                .offset(x: offset)
                .animation(animation, value: offset)

            Spacer()
        }
    }
}
```

## Chapter 27: Transitions in SwiftUI

### Exercise 27.1: Basic Transitions (Solution)

```swift
struct TransitionsView: View {
    @State private var showRed = false
    @State private var showBlue = false
    @State private var showGreen = false

    var body: some View {
        VStack(spacing: 30) {
            // Slide transition
            Button("Toggle Red (Slide)") {
                withAnimation {
                    showRed.toggle()
                }
            }

            if showRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 100)
                    .transition(.slide)
            }

            // Scale transition
            Button("Toggle Blue (Scale)") {
                withAnimation {
                    showBlue.toggle()
                }
            }

            if showBlue {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .transition(.scale)
            }

            // Custom transition
            Button("Toggle Green (Custom)") {
                withAnimation {
                    showGreen.toggle()
                }
            }

            if showGreen {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.green)
                    .frame(width: 200, height: 100)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .leading).combined(with: .opacity),
                            removal: .move(edge: .trailing).combined(with: .opacity)
                        )
                    )
            }

            Spacer()
        }
        .padding()
    }
}
```

## Chapter 28-29: Sheets and Popovers

### Exercise 28.1: Sheet Presentation (Solution)

```swift
struct SheetExampleView: View {
    @State private var showSheet = false
    @State private var showFullScreen = false
    @State private var userName = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Regular sheet
                Button("Show Sheet") {
                    showSheet = true
                }
                .sheet(isPresented: $showSheet) {
                    SheetContentView(userName: $userName)
                }

                // Full screen cover
                Button("Show Full Screen") {
                    showFullScreen = true
                }
                .fullScreenCover(isPresented: $showFullScreen) {
                    FullScreenContentView()
                }

                if !userName.isEmpty {
                    Text("Hello, \(userName)!")
                        .font(.title2)
                        .padding()
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Sheets Demo")
        }
    }
}

struct SheetContentView: View {
    @Binding var userName: String
    @Environment(\.dismiss) var dismiss
    @State private var tempName = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Enter Your Name")
                    .font(.largeTitle)

                TextField("Name", text: $tempName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Save") {
                    userName = tempName
                    dismiss()
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
            .navigationBarItems(
                trailing: Button("Cancel") { dismiss() }
            )
        }
    }
}

struct FullScreenContentView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()

            VStack {
                Text("Full Screen View")
                    .font(.largeTitle)
                    .foregroundColor(.white)

                Button("Dismiss") {
                    dismiss()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            }
        }
    }
}
```

## Chapter 30-31: Navigation

### Exercise 30.1: NavigationView and NavigationLink (Solution)

```swift
struct NavigationExampleView: View {
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

    var body: some View {
        NavigationView {
            List(items, id: \.self) { item in
                NavigationLink(destination: DetailView(item: item)) {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(item)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Items")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {}) {
                    Image(systemName: "plus")
                }
            )
        }
    }
}

struct DetailView: View {
    let item: String
    @State private var isFavorite = false

    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "photo")
                .font(.system(size: 100))
                .foregroundColor(.gray)

            Text(item)
                .font(.largeTitle)

            Button(action: {
                withAnimation {
                    isFavorite.toggle()
                }
            }) {
                HStack {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                    Text(isFavorite ? "Favorited" : "Add to Favorites")
                }
                .padding()
                .background(isFavorite ? Color.red : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}
```

### Exercise 31.1: List Operations (Solution)

```swift
struct EditableListView: View {
    @State private var items = [
        ListItem(name: "Apple", category: "Fruit"),
        ListItem(name: "Carrot", category: "Vegetable"),
        ListItem(name: "Banana", category: "Fruit"),
        ListItem(name: "Broccoli", category: "Vegetable")
    ]
    @State private var showingAddItem = false

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.category)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Image(systemName: item.category == "Fruit" ? "leaf.fill" : "carrot.fill")
                            .foregroundColor(item.category == "Fruit" ? .green : .orange)
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationTitle("Shopping List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddItem = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddItem) {
                AddItemView(items: $items)
            }
        }
    }

    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func moveItems(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}

struct ListItem: Identifiable {
    let id = UUID()
    let name: String
    let category: String
}

struct AddItemView: View {
    @Binding var items: [ListItem]
    @State private var name = ""
    @State private var category = "Fruit"
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                TextField("Item Name", text: $name)

                Picker("Category", selection: $category) {
                    Text("Fruit").tag("Fruit")
                    Text("Vegetable").tag("Vegetable")
                }
            }
            .navigationTitle("Add Item")
            .navigationBarItems(
                leading: Button("Cancel") { dismiss() },
                trailing: Button("Add") {
                    let newItem = ListItem(name: name, category: category)
                    items.append(newItem)
                    dismiss()
                }
                .disabled(name.isEmpty)
            )
        }
    }
}
```

## Chapter 32-34: Alerts, Action Sheets, and Context Menus

### Exercise 32.1: Alerts (Solution)

```swift
struct AlertsView: View {
    @State private var showBasicAlert = false
    @State private var showDestructiveAlert = false
    @State private var showTextFieldAlert = false
    @State private var userName = ""

    var body: some View {
        VStack(spacing: 30) {
            // Basic alert
            Button("Show Basic Alert") {
                showBasicAlert = true
            }
            .alert("Welcome!", isPresented: $showBasicAlert) {
                Button("OK") { }
            } message: {
                Text("This is a basic alert message")
            }

            // Destructive alert
            Button("Show Delete Alert") {
                showDestructiveAlert = true
            }
            .alert("Delete Item?", isPresented: $showDestructiveAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Delete", role: .destructive) {
                    print("Item deleted")
                }
            } message: {
                Text("This action cannot be undone")
            }

            // Alert with text field
            Button("Show Input Alert") {
                showTextFieldAlert = true
            }
            .alert("Enter Name", isPresented: $showTextFieldAlert) {
                TextField("Name", text: $userName)
                Button("OK") { }
                Button("Cancel", role: .cancel) { userName = "" }
            }

            if !userName.isEmpty {
                Text("Hello, \(userName)!")
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
```

### Exercise 33.1: Action Sheets (Solution)

```swift
struct ActionSheetView: View {
    @State private var showActionSheet = false
    @State private var selectedAction = ""

    var body: some View {
        VStack(spacing: 30) {
            Button("Show Actions") {
                showActionSheet = true
            }
            .confirmationDialog("Choose an action", isPresented: $showActionSheet) {
                Button("Save") {
                    selectedAction = "Saved"
                }
                Button("Edit") {
                    selectedAction = "Editing"
                }
                Button("Delete", role: .destructive) {
                    selectedAction = "Deleted"
                }
            }

            if !selectedAction.isEmpty {
                Text("Action: \(selectedAction)")
                    .padding()
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(10)
            }
        }
    }
}
```

### Exercise 34.1: Context Menu (Solution)

```swift
struct ContextMenuView: View {
    @State private var backgroundColor = Color.blue
    @State private var isFavorite = false

    var body: some View {
        VStack(spacing: 30) {
            Text("Long Press Me")
                .font(.title)
                .padding()
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                .contextMenu {
                    Button(action: {
                        backgroundColor = .red
                    }) {
                        Label("Red", systemImage: "paintbrush.fill")
                    }

                    Button(action: {
                        backgroundColor = .green
                    }) {
                        Label("Green", systemImage: "paintbrush.fill")
                    }

                    Button(action: {
                        backgroundColor = .blue
                    }) {
                        Label("Blue", systemImage: "paintbrush.fill")
                    }

                    Divider()

                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Label(isFavorite ? "Unfavorite" : "Favorite",
                              systemImage: isFavorite ? "star.fill" : "star")
                    }
                }

            if isFavorite {
                Label("Favorited!", systemImage: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
```

## Chapter 35-45: Forms and Input Controls

### Exercise 35.1: Complete Form Example (Solution)

```swift
struct CompleteFormView: View {
    @State private var profile = UserProfile()
    @State private var showingSummary = false

    var body: some View {
        NavigationView {
            Form {
                // Text inputs
                Section("Personal Information") {
                    TextField("First Name", text: $profile.firstName)
                    TextField("Last Name", text: $profile.lastName)
                    TextField("Email", text: $profile.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                }

                // Date picker
                Section("Birthday") {
                    DatePicker("Date of Birth",
                              selection: $profile.birthDate,
                              displayedComponents: .date)
                        .datePickerStyle(.compact)
                }

                // Toggle and Slider
                Section("Preferences") {
                    Toggle("Email Notifications", isOn: $profile.emailNotifications)

                    VStack(alignment: .leading) {
                        Text("Text Size: \(Int(profile.textSize))")
                        Slider(value: $profile.textSize, in: 12...24, step: 1)
                    }
                }

                // Picker
                Section("Account Type") {
                    Picker("Plan", selection: $profile.accountType) {
                        Text("Free").tag("Free")
                        Text("Pro").tag("Pro")
                        Text("Premium").tag("Premium")
                    }
                    .pickerStyle(.segmented)
                }

                // Color picker
                Section("Theme") {
                    ColorPicker("Accent Color", selection: $profile.accentColor)
                }

                // Text editor
                Section("Bio") {
                    TextEditor(text: $profile.bio)
                        .frame(height: 100)
                }

                // Stepper
                Section("Settings") {
                    Stepper("Priority Level: \(profile.priorityLevel)",
                           value: $profile.priorityLevel,
                           in: 1...5)
                }
            }
            .navigationTitle("Profile Setup")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        showingSummary = true
                    }
                }
            }
            .sheet(isPresented: $showingSummary) {
                ProfileSummaryView(profile: profile)
            }
        }
    }
}

struct UserProfile {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var emailNotifications = true
    var textSize = 16.0
    var accountType = "Free"
    var accentColor = Color.blue
    var bio = ""
    var priorityLevel = 3
}

struct ProfileSummaryView: View {
    let profile: UserProfile
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    Label("\(profile.firstName) \(profile.lastName)",
                          systemImage: "person.fill")
                    Label(profile.email, systemImage: "envelope.fill")
                    Label("\(profile.birthDate, formatter: DateFormatter.birthDate)",
                          systemImage: "calendar")
                }

                Section("Preferences") {
                    HStack {
                        Text("Notifications")
                        Spacer()
                        Image(systemName: profile.emailNotifications ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(profile.emailNotifications ? .green : .red)
                    }

                    HStack {
                        Text("Account Type")
                        Spacer()
                        Text(profile.accountType)
                            .foregroundColor(.secondary)
                    }

                    HStack {
                        Text("Text Size")
                        Spacer()
                        Text("\(Int(profile.textSize))pt")
                            .foregroundColor(.secondary)
                    }
                }

                if !profile.bio.isEmpty {
                    Section("Bio") {
                        Text(profile.bio)
                    }
                }
            }
            .navigationTitle("Profile Summary")
            .navigationBarItems(trailing: Button("Done") { dismiss() })
        }
    }
}

extension DateFormatter {
    static let birthDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
}
```

## Chapter 43-44: TabView and Dark Mode

### Exercise 43.1: TabView Implementation (Solution)

```swift
struct TabViewExample: View {
    @State private var selectedTab = 0
    @State private var badgeCount = 3

    var body: some View {
        TabView(selection: $selectedTab) {
            // Home tab
            HomeTabView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)

            // Search tab
            SearchTabView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)

            // Notifications tab
            NotificationsTabView(badgeCount: $badgeCount)
                .tabItem {
                    Label("Notifications", systemImage: "bell.fill")
                }
                .badge(badgeCount)
                .tag(2)

            // Profile tab
            ProfileTabView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(3)
        }
        .accentColor(.purple)
    }
}

struct HomeTabView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(1...5, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue.opacity(0.3))
                            .frame(height: 150)
                            .overlay(
                                Text("Card \(index)")
                                    .font(.title2)
                            )
                    }
                }
                .padding()
            }
            .navigationTitle("Home")
        }
    }
}

struct SearchTabView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(1...20, id: \.self) { item in
                    Text("Result \(item)")
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Search")
        }
    }
}

struct NotificationsTabView: View {
    @Binding var badgeCount: Int

    var body: some View {
        NavigationView {
            List {
                ForEach(1...badgeCount, id: \.self) { index in
                    HStack {
                        Image(systemName: "bell.fill")
                            .foregroundColor(.blue)
                        VStack(alignment: .leading) {
                            Text("Notification \(index)")
                            Text("Tap to dismiss")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onTapGesture {
                        badgeCount -= 1
                    }
                }
            }
            .navigationTitle("Notifications")
        }
    }
}

struct ProfileTabView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        NavigationView {
            Form {
                Section("Appearance") {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }
            }
            .navigationTitle("Profile")
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
```

## Chapter 48: Tap Gestures

### Exercise 48.1: Advanced Gestures (Solution)

```swift
struct GesturesView: View {
    @State private var tapCount = 0
    @State private var longPressDetected = false
    @State private var dragOffset = CGSize.zero
    @State private var scale: CGFloat = 1.0

    var body: some View {
        VStack(spacing: 40) {
            // Single and double tap
            Text("Tap Count: \(tapCount)")
                .font(.largeTitle)
                .padding()
                .background(Color.blue.opacity(0.3))
                .cornerRadius(10)
                .onTapGesture(count: 2) {
                    tapCount += 2
                }
                .onTapGesture {
                    tapCount += 1
                }

            // Long press
            Circle()
                .fill(longPressDetected ? Color.green : Color.red)
                .frame(width: 100, height: 100)
                .scaleEffect(longPressDetected ? 1.2 : 1.0)
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation {
                        longPressDetected.toggle()
                    }
                }

            // Drag gesture
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.purple)
                .frame(width: 150, height: 100)
                .offset(dragOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            dragOffset = value.translation
                        }
                        .onEnded { _ in
                            withAnimation {
                                dragOffset = .zero
                            }
                        }
                )

            // Magnification gesture
            Image(systemName: "photo")
                .font(.system(size: 100))
                .scaleEffect(scale)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            scale = value
                        }
                        .onEnded { _ in
                            withAnimation {
                                scale = 1.0
                            }
                        }
                )
        }
        .padding()
    }
}
```

**Beginner Tip**: Start with simple tap gestures before moving to complex ones like drag and magnification!

## Mini-Project: Recipe App

**Goal**: Combine animations, navigation, and forms into a complete app

```swift
struct RecipeApp: View {
    @State private var recipes: [Recipe] = Recipe.sampleData
    @State private var showingAddRecipe = false
    @State private var searchText = ""

    var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return recipes
        } else {
            return recipes.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredRecipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        RecipeRowView(recipe: recipe)
                    }
                }
                .onDelete(perform: deleteRecipe)
            }
            .searchable(text: $searchText)
            .navigationTitle("My Recipes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddRecipe = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddRecipe) {
                AddRecipeView(recipes: $recipes)
            }
        }
    }

    func deleteRecipe(at offsets: IndexSet) {
        recipes.remove(atOffsets: offsets)
    }
}

struct Recipe: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var prepTime: Int
    var difficulty: Difficulty
    var isFavorite: Bool = false

    enum Difficulty: String, CaseIterable {
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"

        var color: Color {
            switch self {
            case .easy: return .green
            case .medium: return .orange
            case .hard: return .red
            }
        }
    }

    static let sampleData = [
        Recipe(name: "Pasta Carbonara", description: "Classic Italian pasta", prepTime: 30, difficulty: .medium),
        Recipe(name: "Greek Salad", description: "Fresh and healthy", prepTime: 15, difficulty: .easy),
        Recipe(name: "Beef Wellington", description: "Gourmet dinner", prepTime: 120, difficulty: .hard)
    ]
}

struct RecipeRowView: View {
    let recipe: Recipe

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text("\(recipe.prepTime) min")
                    .font(.caption)

                Text(recipe.difficulty.rawValue)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(recipe.difficulty.color.opacity(0.2))
                    .foregroundColor(recipe.difficulty.color)
                    .cornerRadius(5)
            }
        }
        .padding(.vertical, 4)
    }
}

struct RecipeDetailView: View {
    let recipe: Recipe
    @State private var isFavorite = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Hero image
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 250)
                    .overlay(
                        Image(systemName: "photo")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                    )

                // Recipe info
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(recipe.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Spacer()

                        Button(action: {
                            withAnimation(.spring()) {
                                isFavorite.toggle()
                            }
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .font(.title)
                                .foregroundColor(isFavorite ? .red : .gray)
                                .scaleEffect(isFavorite ? 1.2 : 1.0)
                        }
                    }

                    Text(recipe.description)
                        .font(.title3)
                        .foregroundColor(.secondary)

                    HStack(spacing: 30) {
                        Label("\(recipe.prepTime) min", systemImage: "clock")
                        Label(recipe.difficulty.rawValue, systemImage: "chart.bar.fill")
                            .foregroundColor(recipe.difficulty.color)
                    }
                }

                // Instructions placeholder
                VStack(alignment: .leading, spacing: 15) {
                    Text("Instructions")
                        .font(.title2)
                        .fontWeight(.semibold)

                    ForEach(1...5, id: \.self) { step in
                        HStack(alignment: .top) {
                            Text("\(step).")
                                .fontWeight(.bold)
                                .frame(width: 30)
                            Text("Add step instructions here...")
                                .foregroundColor(.secondary)
                        }
                    }
                }

                Spacer(minLength: 50)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddRecipeView: View {
    @Binding var recipes: [Recipe]
    @State private var name = ""
    @State private var description = ""
    @State private var prepTime = 30
    @State private var difficulty = Recipe.Difficulty.medium
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                Section("Recipe Details") {
                    TextField("Recipe Name", text: $name)
                    TextField("Description", text: $description)
                }

                Section("Preparation") {
                    Stepper("Prep Time: \(prepTime) min", value: $prepTime, in: 5...240, step: 5)

                    Picker("Difficulty", selection: $difficulty) {
                        ForEach(Recipe.Difficulty.allCases, id: \.self) { level in
                            Text(level.rawValue).tag(level)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("New Recipe")
            .navigationBarItems(
                leading: Button("Cancel") { dismiss() },
                trailing: Button("Save") {
                    let newRecipe = Recipe(
                        name: name,
                        description: description,
                        prepTime: prepTime,
                        difficulty: difficulty
                    )
                    recipes.append(newRecipe)
                    dismiss()
                }
                .disabled(name.isEmpty || description.isEmpty)
            )
        }
    }
}

## Common Animation and Navigation Mistakes

1. **Forgetting withAnimation**
   ```swift
   // Wrong - no animation
   isExpanded.toggle()

   // Correct - smooth animation
   withAnimation {
       isExpanded.toggle()
   }
   ```

2. **Animation on wrong value**
   ```swift
   // Wrong - animates everything
   .animation(.spring())

   // Correct - animates specific value
   .animation(.spring(), value: isExpanded)
   ```

3. **NavigationView placement**
   ```swift
   // Wrong - NavigationView in child
   TabView {
       NavigationView { ... }  // Creates double navigation
   }

   // Correct - NavigationView wraps TabView
   NavigationView {
       TabView { ... }
   }
   ```

## Practice Challenges

### Challenge 1: Photo Gallery
Create an app with:
- Grid of photos with zoom animation
- Fullscreen photo viewer
- Share and favorite actions
- Smooth transitions

### Challenge 2: Workout Tracker
Build a fitness app with:
- Animated progress rings
- Exercise list with timers
- Form for adding workouts
- Statistics with charts

### Challenge 3: Weather App
Design a weather app featuring:
- Animated weather icons
- Scrollable forecast
- Location picker
- Temperature unit toggle

## Summary

You've mastered advanced SwiftUI concepts:
- **Animations**: Bring your UI to life
- **Transitions**: Smooth view changes
- **Navigation**: Multi-screen apps
- **Forms**: Complete user input
- **Gestures**: Advanced interactions
- **TabView**: Complex app structure

These skills enable you to create polished, professional iOS apps!

Next: Move on to `swiftui-ch50-end-solutions.md` for advanced state management.
