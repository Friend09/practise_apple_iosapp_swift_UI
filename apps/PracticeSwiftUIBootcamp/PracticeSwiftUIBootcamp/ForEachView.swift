import SwiftUI

struct ForEachView: View {
    let data: [String] = ["Hi", "Mesharu", "Ela Unnaru"]
    let myString: String = "Hello"
    
    var body: some View {
        VStack {
            Text(myString)
            
            ForEach(data.indices) { index in
                HStack {
                    Text("I am inside a loop. Showing \(data[index])")
                }
            }
        }
    }
}

#Preview {
    ForEachView()
}
