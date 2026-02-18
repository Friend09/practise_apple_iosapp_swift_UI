import SwiftUI

struct ActionsheetView: View {
    
    @State var showActionSheet: Bool = false
    @State var actionSheetOption: ActionSheetOptions = .isOtherPost
    
    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("@username")
                Spacer()
                Button {
                    actionSheetOption = .isMyPost
                    showActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                }
                .tint(.primary)
            }
            .padding(.horizontal)
            Rectangle()
                .aspectRatio(contentMode: .fit)
        }
        .confirmationDialog("What would you like to do?", isPresented: $showActionSheet, titleVisibility: .visible) {
            Button("Share") {
                // add code to share post
            }
            Button("Report", role: .destructive) {
                // add code to report this post
            }
            if actionSheetOption == .isMyPost {
                Button("Delete", role: .destructive) {
                    // add code to delete this post
                }
            }
            Button("Cancel", role: .cancel) {}
        }
    }
}

#Preview {
    ActionsheetView(showActionSheet: false, actionSheetOption: .isOtherPost)
}
