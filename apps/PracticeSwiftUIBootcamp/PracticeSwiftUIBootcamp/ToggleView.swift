import SwiftUI

struct ToggleView: View {
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status:")
                Text(toggleIsOn ? "online" : "offline")
            }
            .font(.title)
            
            Toggle(
                isOn: $toggleIsOn) {
                    Text("Change status")
                }
            
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

#Preview {
    ToggleView()
}
