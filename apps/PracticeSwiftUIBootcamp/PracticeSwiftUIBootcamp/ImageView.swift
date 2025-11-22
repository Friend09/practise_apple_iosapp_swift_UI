import SwiftUI

struct ImageView: View {
    var body: some View {
        Image("raghuvamsi")
            .resizable()
//            .aspectRatio(contentMode: .fit)
            .scaledToFit()
            .frame(width: 600, height: 400)
//            .clipped()
//            .clipShape(
//                Circle()
//                RoundedRectangle(cornerRadius: 25.0)
//                Ellipse()
//            )
    }
}

#Preview {
    ImageView()
}
