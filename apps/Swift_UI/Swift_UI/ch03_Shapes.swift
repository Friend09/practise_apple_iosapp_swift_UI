//## Chapter 3: Creating Shapes in SwiftUI
import SwiftUI

//### Exercise 3.1: Basic Shapes (Beginner)
struct BasicShapesView: View {
    var body: some View{
        VStack(spacing:30) {
//            Circle
            Circle()
                .fill(Color.red)
                .frame(width: 100, height: 100)

//            Rectangle
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 100)
            
//            Rounded Traingle
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .frame(width: 200, height: 100)
            
//            Ellipse
            Ellipse()
                .fill(Color.orange)
                .frame(width:150, height: 80)
            
//            Capsule (stadium shape)
            Capsule()
                .fill(Color.purple)
                .frame(width: 200, height: 60)
        }
    }
}

//struct BasicShapesView_Previews: PreviewProvider {
//    static var previews: some View {
//        BasicShapesView()
//    }
//}


//### Exercise 3.2: Shape Styling (Beginner)
struct StyledShapesView: View {
    var body: some View {
        VStack(spacing: 40) {
//            Stroked Circle
            Circle()
                .stroke(Color.blue, lineWidth: 5)
                .frame(width: 100, height: 100)
            
//            Filled w/ stroke
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.yellow)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 3)
                )
                .frame(width: 200, height: 100)
            
//            Shadow effect
            Circle()
                .fill(Color.red)
                .frame(width: 80, height: 80)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y:5)
            
//            Gradient Fill
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 200, height: 100)
                .cornerRadius(20)
        }
    }
}

struct StyledShapesView_Previews: PreviewProvider {
    static var previews: some View {
        StyledShapesView()
    }
}
