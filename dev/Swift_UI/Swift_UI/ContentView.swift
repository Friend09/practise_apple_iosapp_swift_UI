//## Chapter 2: Adding Text in SwiftUI
//
//### Exercise 2.1: Basic Text Display (Beginner)

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello SwiftUI!")
            Text("Welcome to iOS Development")
            Text("Learn SwiftUI")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}




//### Exercise 2.2: Multi-line Text and Alignment (Beginner)
//
//**Goal**: Handle longer text and control alignment
//



//
//**Try This**: Change `.lineLimit(2)` to `nil` to allow unlimited lines


// have this to preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
