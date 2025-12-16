import SwiftUI

struct SafeAreaView: View {
    var body: some View {

        ScrollView {
            VStack {
                Text("Title goes Here")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding(20)
                }
            }
        }
        .background(
            Color.red
                .ignoresSafeArea(edges: .top)
        )
    }
}

#Preview {
    SafeAreaView()
}
