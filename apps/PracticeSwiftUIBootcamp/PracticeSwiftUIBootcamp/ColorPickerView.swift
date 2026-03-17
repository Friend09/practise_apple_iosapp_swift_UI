import SwiftUI

struct ColorPickerView: View {
    
    @State var backgroundColor: Color = .green
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            ColorPicker(
                "Select a color",
                selection: $backgroundColor,
                supportsOpacity: true
            )
            .padding()
            .background(Color.black)
            .clipShape(.buttonBorder)
            .foregroundStyle(.white)
            .font(.headline)
            .padding(50)
        }
    }
}

#Preview {
    ColorPickerView()
}
