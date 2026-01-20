import SwiftUI

struct SheetsView: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea(.all)
            Button(
                action: { showSheet.toggle() },
                label: {
                    Text("Button")
                        .foregroundStyle(.green)
                        .font(.headline)
                        .padding(20)
                        .background(Color.white.cornerRadius(10))
                }
            )
//            .fullScreenCover(isPresented: $showSheet) {
//                SecondScreen()
//            }
            .sheet(isPresented: $showSheet) {
                SecondScreen()
            }
        }
        
    }
}

struct SecondScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .ignoresSafeArea(.all)
            Button(action: { dismiss() }) {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding(20)
            }
        }
    }
}

#Preview {
    SheetsView()
//    SecondScreen()
}
