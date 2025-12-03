import SwiftUI

struct StacksView: View {
    var body: some View {
        VStack(spacing: 50) {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
            Text("1")
                .font(.title)
                .foregroundStyle(.red)
            }
        }
        
        Text("1")
            .font(.title)
            .foregroundStyle(.white)
            .background(
                Circle()
                    .frame(width: 100, height: 100)
            )
    }
}

#Preview {
    StacksView()
}
