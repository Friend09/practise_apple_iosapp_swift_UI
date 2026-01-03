import SwiftUI

struct ExtractFunctionsView: View {
    
    @State var backgroundColor: Color = Color.pink
    
    var body: some View {
        ZStack {
            //background
            backgroundColor
                .ignoresSafeArea(.all)
            
            //content
            contentLayer
        }
    }
    
    var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            
            Button(action: {buttonPressed()}, label:  {
                Text("PRESS ME")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            })
            
            Button {
                backgroundColor = .pink
            } label: {
                Text("DEFAULT")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
            }

        }
    }
    
    func buttonPressed() {
        backgroundColor = .yellow
    }
}

#Preview {
    ExtractFunctionsView()
}
