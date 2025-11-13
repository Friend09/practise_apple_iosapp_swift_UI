import SwiftUI

struct ShapesView: View {
    var body: some View {
//        Circle()
//        Ellipse()
//        Capsule(style: .circular)
        Rectangle()
            .fill(Color.blue)
//            .foregroundColor(.green)
//            .stroke()
//            .stroke(Color.red)
//            .stroke(Color.blue, lineWidth: 10)
//            .stroke(Color.orange, style: StrokeStyle(lineWidth: 30, lineCap: .round, dash: [50]))
//            .trim(from: 0.4, to: 1.0)
//            .stroke(Color.purple)
//            .strokeBorder(Color.red)
            .frame(width: 300, height: 200)
            .shadow(radius: 50)
    }
}

#Preview {
    ShapesView()
}
