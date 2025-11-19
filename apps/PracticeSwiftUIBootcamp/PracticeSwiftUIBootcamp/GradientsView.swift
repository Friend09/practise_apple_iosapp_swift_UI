import SwiftUI

struct GradientsView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
//                LinearGradient(
//                    colors: [Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))],
//                    startPoint: .topLeading,
//                    endPoint: .bottom
//                )
                
//                RadialGradient(
//                    gradient: Gradient(
//                        colors: [Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)), Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))]
//                    ),
//                    center: .topLeading,
//                    startRadius: 5,
//                    endRadius: 400
//                )
                
                AngularGradient(
                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)),Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))]),
                    center: .topLeading,
                    angle: .degrees(180+45)
                )
            )
            .frame(width: 300, height: 200)
    }
}

#Preview {
    GradientsView()
}
