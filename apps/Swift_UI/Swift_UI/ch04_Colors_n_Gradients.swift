//  ch04_Colors_n_Gradients.swift
import SwiftUI
//## Chapter 4: Colors and Gradients

//### Exercise 4.1: Working with Colors (Solution)
struct ColorsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
//                System colors
                HStack(spacing: 20) {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 80, height: 80)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 80, height: 80)
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 80, height: 80)
                }
                
//                Custom RGB
                Rectangle()
                    .fill(Color(red:0.7, green: 0.3, blue: 0.8))
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                
//                Semantic Colors
                VStack(spacing: 10) {
                    Text("Primary Color")
                        .foregroundColor(.primary)
                    Text("Secondary Color")
                        .foregroundColor(.secondary)
                    Rectangle()
                        .fill(Color(.systemBackground))
                        .frame(width: 200, height: 200)
                        .overlay(
                            Text("System Background")
                        )
                }
                
//                Opacity
                HStack(spacing: 10) {
                    Rectangle()
                        .fill(Color.blue.opacity(0.3))
                        .frame(width: 80, height: 80)
                    Rectangle()
                        .fill(Color.blue.opacity(0.6))
                        .frame(width: 80, height: 80)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 80, height: 80)
                }
            }
            .padding()
        }
    }
}

//#Preview {
//    ColorsView()
//}


//### Exercise 4.2: Gradient Mastery (Solution)

struct GradientView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
//                Linear Gradient
                Text("Linear Gradients")
                    .font(.headline)
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [.red, .orange, .yellow],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(height: 100)
                    .cornerRadius(20)
                
//                Radial Gradient
                Text("Radial Gradient")
                    .font(.headline)
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [.white, .blue, .black],
                            center: .center,
                            startRadius: 5,
                            endRadius: 100
                        )
                    )
                    .frame(width: 200, height: 200)
                
//                Angular Gradient
                Text("Angular Gradient")
                    .font(.headline)
                
                Circle()
                    .fill(
                        AngularGradient(
                            colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center
                        )
                    )
                    .frame(width: 200, height: 200)
                
//                Gradient as background
                Text("Gradient Background")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [.purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing
                        )
                        .cornerRadius(20)
                    )
            }
            .padding()
        }
    }
}

#Preview {
    GradientView()
}
