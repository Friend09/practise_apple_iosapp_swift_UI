# SwiftUI Beginner's Guide: Advanced State Management (Chapters 50-End)

This guide provides beginner-friendly solutions for SwiftUI's advanced state management patterns. Master these to build complex, data-driven applications.

**For Beginners**: Think of state management as the brain of your app - it controls what data is shown and how it changes!

## Chapter 50-51: ObservableObject and StateObject

### Exercise 50.1: Understanding ObservableObject (Solution)

```swift
import SwiftUI
import Combine

// ViewModel - the brain of your app
class UserViewModel: ObservableObject {
    // @Published tells SwiftUI to watch for changes
    @Published var userName = ""
    @Published var userAge = 0
    @Published var isLoggedIn = false
    @Published var favoriteItems: [String] = []

    // Computed property
    var userInfo: String {
        if userName.isEmpty {
            return "No user logged in"
        }
        return "\(userName), age \(userAge)"
    }

    // Methods to update state
    func login(name: String, age: Int) {
        userName = name
        userAge = age
        isLoggedIn = true
    }

    func logout() {
        userName = ""
        userAge = 0
        isLoggedIn = false
        favoriteItems.removeAll()
    }

    func toggleFavorite(_ item: String) {
        if favoriteItems.contains(item) {
            favoriteItems.removeAll { $0 == item }
        } else {
            favoriteItems.append(item)
        }
    }
}

// Main view using @StateObject
struct StateObjectExampleView: View {
    // @StateObject creates and owns the instance
    @StateObject private var viewModel = UserViewModel()

    var body: some View {
        NavigationView {
            if viewModel.isLoggedIn {
                LoggedInView(viewModel: viewModel)
            } else {
                LoginView(viewModel: viewModel)
            }
        }
    }
}

// Child view using @ObservedObject
struct LoginView: View {
    // @ObservedObject watches an existing instance
    @ObservedObject var viewModel: UserViewModel
    @State private var name = ""
    @State private var age = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            TextField("Enter your age", text: $age)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding(.horizontal)

            Button("Login") {
                if let userAge = Int(age) {
                    viewModel.login(name: name, age: userAge)
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(name.isEmpty || age.isEmpty)
        }
        .padding()
    }
}

struct LoggedInView: View {
    @ObservedObject var viewModel: UserViewModel
    let items = ["SwiftUI", "Xcode", "iOS", "macOS", "iPadOS"]

    var body: some View {
        VStack {
            Text("Hello, \(viewModel.userName)!")
                .font(.title)
                .padding()

            List {
                Section("Available Items") {
                    ForEach(items, id: \.self) { item in
                        HStack {
                            Text(item)
                            Spacer()
                            Image(systemName: viewModel.favoriteItems.contains(item) ? "heart.fill" : "heart")
                                .foregroundColor(viewModel.favoriteItems.contains(item) ? .red : .gray)
                                .onTapGesture {
                                    viewModel.toggleFavorite(item)
                                }
                        }
                    }
                }

                Section("Your Favorites") {
                    if viewModel.favoriteItems.isEmpty {
                        Text("No favorites yet")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(viewModel.favoriteItems, id: \.self) { item in
                            Text(item)
                        }
                    }
                }
            }

            Button("Logout") {
                viewModel.logout()
            }
            .buttonStyle(.bordered)
            .padding()
        }
        .navigationTitle(viewModel.userInfo)
        .navigationBarTitleDisplayMode(.inline)
    }
}
```

**Python Comparison**:
```python
# In Python, you might use a class with callbacks
class UserViewModel:
    def __init__(self):
        self.userName = ""
        self.observers = []

    def set_userName(self, name):
        self.userName = name
        self.notify_observers()  # Manual update

# In SwiftUI, @Published handles this automatically!
```

### Exercise 50.2: StateObject vs ObservedObject (Solution)

```swift
// Understanding the difference
struct ParentView: View {
    // Use @StateObject when creating the instance
    @StateObject private var parentViewModel = TimerViewModel()

    var body: some View {
        VStack {
            Text("Parent Timer: \(parentViewModel.seconds)")
                .font(.title)

            // Pass to child views
            ChildView(timerViewModel: parentViewModel)

            Button("Reset Timer") {
                parentViewModel.reset()
            }
        }
        .onAppear {
            parentViewModel.start()
        }
    }
}

struct ChildView: View {
    // Use @ObservedObject when receiving an instance
    @ObservedObject var timerViewModel: TimerViewModel

    var body: some View {
        VStack {
            Text("Child sees: \(timerViewModel.seconds)")
                .foregroundColor(.blue)

            Button("Pause/Resume") {
                timerViewModel.togglePause()
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

class TimerViewModel: ObservableObject {
    @Published var seconds = 0
    @Published var isPaused = false
    private var timer: Timer?

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if !self.isPaused {
                self.seconds += 1
            }
        }
    }

    func togglePause() {
        isPaused.toggle()
    }

    func reset() {
        seconds = 0
    }

    deinit {
        timer?.invalidate()
    }
}
```

**Beginner Rule**:
- Use `@StateObject` when you CREATE the object
- Use `@ObservedObject` when you RECEIVE the object

## Chapter 52: EnvironmentObject

### Exercise 52.1: App-Wide State Management (Solution)

```swift
// Settings that the whole app needs
class AppSettings: ObservableObject {
    @Published var isDarkMode = false
    @Published var fontSize: Double = 16
    @Published var accentColor = Color.blue
    @Published var userName = "Guest"
    @Published var notificationsEnabled = true
}

// Main App
struct EnvironmentObjectApp: App {
    @StateObject private var settings = AppSettings()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)  // Inject into environment
        }
    }
}

// Root view
struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

// Any child can access the environment object
struct HomeView: View {
    @EnvironmentObject var settings: AppSettings

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome, \(settings.userName)!")
                    .font(.system(size: settings.fontSize + 8))
                    .fontWeight(.bold)

                Text("Your app is in \(settings.isDarkMode ? "Dark" : "Light") mode")
                    .font(.system(size: settings.fontSize))

                if settings.notificationsEnabled {
                    Label("Notifications are ON", systemImage: "bell.fill")
                        .foregroundColor(.green)
                } else {
                    Label("Notifications are OFF", systemImage: "bell.slash")
                        .foregroundColor(.red)
                }

                Spacer()

                // Navigate to deeply nested view
                NavigationLink("Go to Details", destination: DeeplyNestedView())
            }
            .padding()
            .navigationTitle("Home")
            .foregroundColor(settings.accentColor)
        }
        .preferredColorScheme(settings.isDarkMode ? .dark : .light)
    }
}

// Even deeply nested views can access it
struct DeeplyNestedView: View {
    @EnvironmentObject var settings: AppSettings

    var body: some View {
        VStack {
            Text("This is a deeply nested view")
                .font(.system(size: settings.fontSize))

            Text("But I can still see: \(settings.userName)")
                .foregroundColor(settings.accentColor)
        }
    }
}

struct SettingsView: View {
    @EnvironmentObject var settings: AppSettings

    var body: some View {
        NavigationView {
            Form {
                Section("Appearance") {
                    Toggle("Dark Mode", isOn: $settings.isDarkMode)

                    HStack {
                        Text("Font Size: \(Int(settings.fontSize))")
                        Slider(value: $settings.fontSize, in: 12...24, step: 1)
                    }

                    ColorPicker("Accent Color", selection: $settings.accentColor)
                }

                Section("Profile") {
                    TextField("User Name", text: $settings.userName)
                }

                Section("Notifications") {
                    Toggle("Enable Notifications", isOn: $settings.notificationsEnabled)
                }
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(settings.isDarkMode ? .dark : .light)
    }
}
```

**Beginner Tip**: EnvironmentObject is like a global variable that any view can access - perfect for app-wide settings!

## Chapter 53: AppStorage for Persistence

### Exercise 53.1: Saving User Preferences (Solution)

```swift
struct AppStorageExampleView: View {
    // @AppStorage automatically saves to UserDefaults
    @AppStorage("username") private var userName = "Guest"
    @AppStorage("isFirstLaunch") private var isFirstLaunch = true
    @AppStorage("favoriteColor") private var favoriteColorHex = "007AFF" // Blue
    @AppStorage("highScore") private var highScore = 0
    @AppStorage("soundEnabled") private var soundEnabled = true

    @State private var currentScore = 0
    @State private var showOnboarding = false

    var favoriteColor: Color {
        Color(hex: favoriteColorHex) ?? .blue
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Welcome message
                Text("Welcome, \(userName)!")
                    .font(.largeTitle)
                    .foregroundColor(favoriteColor)

                // Score display
                VStack {
                    Text("High Score: \(highScore)")
                        .font(.title2)

                    Text("Current Score: \(currentScore)")
                        .font(.title3)

                    HStack {
                        Button("Score!") {
                            currentScore += 10
                            if currentScore > highScore {
                                highScore = currentScore
                            }
                        }
                        .buttonStyle(.borderedProminent)

                        Button("Reset") {
                            currentScore = 0
                        }
                        .buttonStyle(.bordered)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)

                // Settings
                Form {
                    Section("Profile") {
                        TextField("Your Name", text: $userName)
                    }

                    Section("Preferences") {
                        Toggle("Sound Effects", isOn: $soundEnabled)

                        ColorPicker("Favorite Color", selection: Binding(
                            get: { favoriteColor },
                            set: { favoriteColorHex = $0.toHex() ?? "007AFF" }
                        ))
                    }

                    Section("Data") {
                        Button("Reset High Score") {
                            highScore = 0
                        }
                        .foregroundColor(.red)

                        Button("Reset All Settings") {
                            userName = "Guest"
                            favoriteColorHex = "007AFF"
                            highScore = 0
                            soundEnabled = true
                            isFirstLaunch = true
                        }
                        .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Persistent Data")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            if isFirstLaunch {
                showOnboarding = true
                isFirstLaunch = false
            }
        }
        .sheet(isPresented: $showOnboarding) {
            OnboardingView(userName: $userName)
        }
    }
}

struct OnboardingView: View {
    @Binding var userName: String
    @State private var tempName = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 30) {
            Text("Welcome to the App!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Let's get you set up")
                .font(.title2)
                .foregroundColor(.secondary)

            TextField("Enter your name", text: $tempName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("Get Started") {
                userName = tempName.isEmpty ? "Guest" : tempName
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

// Helper extension for Color
extension Color {
    func toHex() -> String? {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return String(format: "%02lX%02lX%02lX",
                     lround(Double(red * 255)),
                     lround(Double(green * 255)),
                     lround(Double(blue * 255)))
    }

    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        self.init(
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0
        )
    }
}
```

## Chapter 54: Onboarding with State Management

### Exercise 54.1: Complete Onboarding Flow (Solution)

```swift
struct OnboardingApp: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @StateObject private var userProfile = UserProfile()

    var body: some View {
        if hasCompletedOnboarding {
            MainAppView()
                .environmentObject(userProfile)
        } else {
            OnboardingFlowView(hasCompletedOnboarding: $hasCompletedOnboarding)
                .environmentObject(userProfile)
        }
    }
}

class UserProfile: ObservableObject {
    @Published var name = ""
    @Published var age = 0
    @Published var interests: Set<String> = []
    @Published var notificationPreference = true
    @Published var profileImage: String = "person.circle"
}

struct OnboardingFlowView: View {
    @Binding var hasCompletedOnboarding: Bool
    @EnvironmentObject var userProfile: UserProfile
    @State private var currentPage = 0

    var body: some View {
        TabView(selection: $currentPage) {
            WelcomePage()
                .tag(0)

            NamePage()
                .tag(1)

            InterestsPage()
                .tag(2)

            NotificationPage()
                .tag(3)

            CompletionPage(hasCompletedOnboarding: $hasCompletedOnboarding)
                .tag(4)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .animation(.easeInOut, value: currentPage)
    }
}

struct WelcomePage: View {
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "hand.wave.fill")
                .font(.system(size: 80))
                .foregroundColor(.blue)

            Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Let's get your account set up in just a few steps")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)

            Text("Swipe to continue →")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.top, 50)
        }
    }
}

struct NamePage: View {
    @EnvironmentObject var userProfile: UserProfile

    var body: some View {
        VStack(spacing: 30) {
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Enter your name", text: $userProfile.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 50)

            if !userProfile.name.isEmpty {
                Text("Nice to meet you, \(userProfile.name)!")
                    .foregroundColor(.secondary)
                    .transition(.opacity)
            }
        }
        .padding()
    }
}

struct InterestsPage: View {
    @EnvironmentObject var userProfile: UserProfile
    let interests = ["Technology", "Sports", "Music", "Art", "Travel", "Food", "Gaming", "Reading"]

    var body: some View {
        VStack(spacing: 20) {
            Text("What are you interested in?")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Select all that apply")
                .foregroundColor(.secondary)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 15) {
                ForEach(interests, id: \.self) { interest in
                    InterestButton(
                        interest: interest,
                        isSelected: userProfile.interests.contains(interest)
                    ) {
                        if userProfile.interests.contains(interest) {
                            userProfile.interests.remove(interest)
                        } else {
                            userProfile.interests.insert(interest)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct InterestButton: View {
    let interest: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(interest)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(20)
        }
    }
}

struct NotificationPage: View {
    @EnvironmentObject var userProfile: UserProfile

    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "bell.badge.fill")
                .font(.system(size: 80))
                .foregroundColor(.orange)

            Text("Stay Updated")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Would you like to receive notifications about updates and new features?")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)

            Toggle("Enable Notifications", isOn: $userProfile.notificationPreference)
                .toggleStyle(SwitchToggleStyle(tint: .orange))
                .padding(.horizontal, 50)
        }
        .padding()
    }
}

struct CompletionPage: View {
    @Binding var hasCompletedOnboarding: Bool
    @EnvironmentObject var userProfile: UserProfile

    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)

            Text("All Set!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Welcome, \(userProfile.name)!")
                .font(.title2)

            if !userProfile.interests.isEmpty {
                Text("We'll personalize your experience based on your interests")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
            }

            Button("Get Started") {
                withAnimation {
                    hasCompletedOnboarding = true
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .padding()
    }
}

struct MainAppView: View {
    @EnvironmentObject var userProfile: UserProfile

    var body: some View {
        TabView {
            Text("Home View\nWelcome, \(userProfile.name)!")
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            Text("Your Interests:\n\(userProfile.interests.joined(separator: ", "))")
                .tabItem {
                    Label("Interests", systemImage: "star")
                }
        }
    }
}
```

## Mini-Project: Task Management App

**Goal**: Combine all state management concepts into a complete app

```swift
// MARK: - Models
struct Task: Identifiable, Codable {
    let id = UUID()
    var title: String
    var description: String
    var isCompleted: Bool
    var priority: Priority
    var dueDate: Date?
    var category: String

    enum Priority: String, CaseIterable, Codable {
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

// MARK: - ViewModels
class TaskStore: ObservableObject {
    @Published var tasks: [Task] = [] {
        didSet {
            saveTasks()
        }
    }

    @Published var searchText = ""
    @Published var filterCategory = "All"
    @Published var showCompletedOnly = false

    var filteredTasks: [Task] {
        var result = tasks

        // Filter by search
        if !searchText.isEmpty {
            result = result.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.description.localizedCaseInsensitiveContains(searchText)
            }
        }

        // Filter by category
        if filterCategory != "All" {
            result = result.filter { $0.category == filterCategory }
        }

        // Filter by completion
        if showCompletedOnly {
            result = result.filter { $0.isCompleted }
        }

        return result.sorted { !$0.isCompleted && $1.isCompleted }
    }

    var categories: [String] {
        let allCategories = tasks.map { $0.category }
        return ["All"] + Array(Set(allCategories)).sorted()
    }

    init() {
        loadTasks()
    }

    func addTask(_ task: Task) {
        tasks.append(task)
    }

    func toggleTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func deleteTask(_ task: Task) {
        tasks.removeAll { $0.id == task.id }
    }

    // Persistence
    private func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "SavedTasks")
        }
    }

    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: "SavedTasks"),
           let decoded = try? JSONDecoder().decode([Task].self, from: data) {
            tasks = decoded
        }
    }
}

class SettingsStore: ObservableObject {
    @AppStorage("defaultCategory") var defaultCategory = "Personal"
    @AppStorage("defaultPriority") var defaultPriority = Task.Priority.medium.rawValue
    @AppStorage("showBadgeCount") var showBadgeCount = true
    @AppStorage("useDarkMode") var useDarkMode = false
}

// MARK: - Views
struct TaskManagementApp: View {
    @StateObject private var taskStore = TaskStore()
    @StateObject private var settings = SettingsStore()

    var body: some View {
        ContentView()
            .environmentObject(taskStore)
            .environmentObject(settings)
            .preferredColorScheme(settings.useDarkMode ? .dark : .light)
    }
}

struct ContentView: View {
    @EnvironmentObject var taskStore: TaskStore
    @State private var showingAddTask = false

    var body: some View {
        NavigationView {
            VStack {
                // Filter bar
                FilterBarView()

                // Task list
                if taskStore.filteredTasks.isEmpty {
                    EmptyStateView()
                } else {
                    List {
                        ForEach(taskStore.filteredTasks) { task in
                            TaskRowView(task: task)
                        }
                        .onDelete { offsets in
                            for index in offsets {
                                taskStore.deleteTask(taskStore.filteredTasks[index])
                            }
                        }
                    }
                }
            }
            .navigationTitle("My Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddTask = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddTask) {
                AddTaskView()
            }
            .searchable(text: $taskStore.searchText)
        }
    }
}

struct FilterBarView: View {
    @EnvironmentObject var taskStore: TaskStore

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(taskStore.categories, id: \.self) { category in
                    FilterChip(
                        title: category,
                        isSelected: taskStore.filterCategory == category
                    ) {
                        taskStore.filterCategory = category
                    }
                }

                Divider()
                    .frame(height: 20)

                FilterChip(
                    title: "Completed",
                    isSelected: taskStore.showCompletedOnly,
                    icon: "checkmark.circle"
                ) {
                    taskStore.showCompletedOnly.toggle()
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 8)
    }
}

struct FilterChip: View {
    let title: String
    let isSelected: Bool
    var icon: String? = nil
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.caption)
                }
                Text(title)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
            .foregroundColor(isSelected ? .white : .primary)
            .cornerRadius(20)
        }
    }
}

struct TaskRowView: View {
    let task: Task
    @EnvironmentObject var taskStore: TaskStore

    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    taskStore.toggleTask(task)
                }
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
                    .font(.title2)
            }
            .buttonStyle(PlainButtonStyle())

            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .font(.headline)
                    .strikethrough(task.isCompleted)

                if !task.description.isEmpty {
                    Text(task.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }

                HStack {
                    Label(task.category, systemImage: "folder")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Spacer()

                    if let dueDate = task.dueDate {
                        Label(dueDate, formatter: dateFormatter)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Circle()
                        .fill(task.priority.color)
                        .frame(width: 10, height: 10)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var taskStore: TaskStore
    @EnvironmentObject var settings: SettingsStore

    @State private var title = ""
    @State private var description = ""
    @State private var category = ""
    @State private var priority = Task.Priority.medium
    @State private var hasDueDate = false
    @State private var dueDate = Date()

    var body: some View {
        NavigationView {
            Form {
                Section("Task Details") {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description, axis: .vertical)
                        .lineLimit(3...6)
                }

                Section("Organization") {
                    TextField("Category", text: $category)
                        .onAppear {
                            category = settings.defaultCategory
                        }

                    Picker("Priority", selection: $priority) {
                        ForEach(Task.Priority.allCases, id: \.self) { priority in
                            Label(priority.rawValue.capitalized, systemImage: "circle.fill")
                                .foregroundColor(priority.color)
                                .tag(priority)
                        }
                    }
                    .onAppear {
                        priority = Task.Priority(rawValue: settings.defaultPriority) ?? .medium
                    }
                }

                Section("Due Date") {
                    Toggle("Set due date", isOn: $hasDueDate)

                    if hasDueDate {
                        DatePicker("Due date", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                    }
                }
            }
            .navigationTitle("New Task")
            .navigationBarItems(
                leading: Button("Cancel") { dismiss() },
                trailing: Button("Add") {
                    let newTask = Task(
                        title: title,
                        description: description,
                        isCompleted: false,
                        priority: priority,
                        dueDate: hasDueDate ? dueDate : nil,
                        category: category.isEmpty ? "General" : category
                    )
                    taskStore.addTask(newTask)
                    dismiss()
                }
                .disabled(title.isEmpty)
            )
        }
    }
}

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle")
                .font(.system(size: 60))
                .foregroundColor(.gray)

            Text("No tasks found")
                .font(.title2)
                .fontWeight(.semibold)

            Text("Add a task to get started")
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()
```

## Common State Management Mistakes

1. **Using @ObservedObject instead of @StateObject**
   ```swift
   // Wrong - creates new instance on every view update
   struct MyView: View {
       @ObservedObject var viewModel = MyViewModel()
   }

   // Correct - preserves instance
   struct MyView: View {
       @StateObject var viewModel = MyViewModel()
   }
   ```

2. **Forgetting @Published**
   ```swift
   // Wrong - SwiftUI won't update
   class ViewModel: ObservableObject {
       var count = 0  // Missing @Published
   }

   // Correct
   class ViewModel: ObservableObject {
       @Published var count = 0
   }
   ```

3. **Not passing EnvironmentObject to sheets**
   ```swift
   // Wrong - crash if sheet uses @EnvironmentObject
   .sheet(isPresented: $show) {
       SheetView()
   }

   // Correct
   .sheet(isPresented: $show) {
       SheetView()
           .environmentObject(myObject)
   }
   ```

## Practice Challenges

### Challenge 1: Shopping List
Create an app with:
- Multiple shopping lists
- Shared state between views
- Persistence with AppStorage
- Category management

### Challenge 2: Habit Tracker
Build a habit tracking app with:
- Daily habit checklist
- Progress tracking
- Statistics view
- Data persistence

### Challenge 3: Budget Manager
Design a budget app featuring:
- Income/expense tracking
- Category-based budgets
- Monthly summaries
- Data export

## Summary

You've mastered advanced SwiftUI state management:
- **@ObservableObject**: Share complex state
- **@StateObject**: Create and own observable objects
- **@EnvironmentObject**: App-wide state sharing
- **@AppStorage**: Automatic persistence
- **Combine**: Reactive programming basics

With these tools, you can build sophisticated, data-driven apps with proper state management!

## Congratulations!

You've completed the SwiftUI learning journey! You now have the skills to:
- Build beautiful UIs with SwiftUI
- Manage complex app state
- Create smooth animations
- Handle user input effectively
- Persist data across app launches

Keep practicing and building amazing apps! 🚀
