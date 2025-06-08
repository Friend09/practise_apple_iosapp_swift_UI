import SwiftUI

// ### Exercise 2.1: Basic Text Display (Solution)

struct TextBasicsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello Swift UI")
            Text("Welcome to iOS Development")
            Text("Learn SwiftUI")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
        }
    }
}

//// preview
//struct TextBasicsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextBasicsView()
//    }
//}

// ### Exercise 2.2: Advanced Text Styling (Solution)
struct AdvanedTextView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Custom Size")
                .font(.system(size: 24))
            Text("This is a longer text that will wrap to multiple lines when needed")
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .truncationMode(.tail)
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

// preview
struct AdvanedTextView_Previews: PreviewProvider {
    static var previews: some View {
        AdvanedTextView()
    }
}

// ### Exercise 2.3: Dynamic Text (Solution)
struct DynamicTextView
