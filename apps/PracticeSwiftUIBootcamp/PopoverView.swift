import SwiftUI

struct PopoverView: View {
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea(.all)
            
            VStack{
                Button("Button") {
                    withAnimation(.spring()) {
                        showNewScreen.toggle()
                    }
                }
                .font(.largeTitle)
                Spacer()
            }
            // METHOD 1 - SHEET
//            .sheet(isPresented: $showNewScreen) {
//                NewScreen(showNewScreen: $showNewScreen)
//            }
            // METHOD 2 - TRANSITION
//            ZStack {
//                if showNewScreen {
//                    NewScreen(showNewScreen: $showNewScreen)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                }
//            }

            // METHOD 3 - ANIMATION OFFSET
            GeometryReader { geometry in
                NewScreen(showNewScreen: $showNewScreen)
                    .padding(.top, 100)
                    .offset(y: showNewScreen ? 0 : geometry.size.height)
            }
        }
    }
}

struct NewScreen: View {
    @Environment(\.isPresented) var isPresented
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .ignoresSafeArea(.all)
            Button(action: { showNewScreen.toggle() }) {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding(20)
            }
        }
    }
}

#Preview {
    PopoverView()
}

