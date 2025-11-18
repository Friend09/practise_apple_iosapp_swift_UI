import SwiftUI

struct ColorsView: View {
    @State private var selectedColor = Color.green
    
    var body: some View {
        VStack {
            ColorPicker("Pick a color", selection: $selectedColor)
            Rectangle()
                .fill(selectedColor)
                .frame(width: 300, height: 250)
                .shadow(color: Color(red: 0.50, green: 0.50, blue: 0.50).opacity(0.8),
                        radius: 10.00, x: 0.00, y: 0.00)
        }
        .padding()
    }
}

#Preview {
    ColorsView()
}
