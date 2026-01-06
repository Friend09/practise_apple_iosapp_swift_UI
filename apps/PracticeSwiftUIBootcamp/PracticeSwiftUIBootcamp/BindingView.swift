import SwiftUI

struct BindingView: View {
    
    @State var backgroundColor: Color = Color.green
    @State var title: String = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            
            VStack {
                Text(title)
                    .foregroundStyle(.white)
                
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}


struct ButtonView: View {
    
    @Binding var backgroundColor: Color
    @Binding var title: String
    @State var buttonColor: Color = Color.blue
    
    var body: some View {
        Button {
            backgroundColor = Color.orange
            buttonColor = Color.pink
            title = "NEW TITLE"
        } label: {
            Text("Button")
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        }
        
        Button {
            backgroundColor = Color.green
            buttonColor = Color.brown
            title = "Title"
        } label: {
            Text("Button2")
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        }
    }
    
}

#Preview {
    BindingView()
}
