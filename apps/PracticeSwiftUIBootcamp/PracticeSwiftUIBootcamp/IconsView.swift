import SwiftUI

struct IconsView: View {
    var body: some View {
        Image(systemName: "heart.fill")
//            .renderingMode(.original)
            .font(.largeTitle)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
            .scaledToFit()
            //.scaledToFill()
            .font(.caption)
//            .font(.system(size: 2000))
            .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
//            .frame(width: 400, height: 400)
            .clipped()
    }
}

#Preview {
    IconsView()
}
