import SwiftUI

struct TextEditorView: View {
    
    @State var textEditorText: String = "This is the starting text"
    @State var savedText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                    .colorMultiply(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                    .cornerRadius(10)
                Button {
                    savedText = textEditorText
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(.buttonBorder)
                        .padding()
                }
                Text(savedText)
                Spacer()
            }
            .padding()
            .navigationTitle("TextEditor Bootcamp!")
        }
    }
}

#Preview {
    TextEditorView()
}
