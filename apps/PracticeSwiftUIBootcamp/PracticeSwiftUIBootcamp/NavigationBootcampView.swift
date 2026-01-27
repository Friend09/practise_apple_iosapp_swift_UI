import SwiftUI

struct NavigationBootcampView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink {
                    MyOtherScreen()
                } label: {
                    Text("Hello World!")
                }
                Text("item 1")
                Text("item 2")
                Text("item 3")
                }
            .navigationTitle("All Inboxes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.automatic)
            .navigationBarItems(
                leading:
                    HStack {
                        Image(systemName: "person.fill")
                        Image(systemName: "flame.fill")
                    },
                trailing: NavigationLink(
                    destination: MyOtherScreen(),
                    label: {
                        Image(systemName: "gear")
                    }
                )
                .tint(.gray)
            )
            }
        }
    }


struct MyOtherScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
                .navigationTitle("Green Screen!")
                //.navigationBarHidden(true)
            
            VStack {
                Button("BACK BUTTON") {
                    presentationMode.wrappedValue.dismiss()
                }
                
                NavigationLink("Click here", destination: Text("3rd screen!"))
            }
        }
    }
}

#Preview {
    NavigationBootcampView()
//    MyOtherScreen()
}
