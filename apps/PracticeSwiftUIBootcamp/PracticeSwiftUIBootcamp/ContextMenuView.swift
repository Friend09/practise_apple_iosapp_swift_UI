//
//  ContextMenuView.swift
//  SwiftfulThinkingBootcamp
//
//  Modernized by Assistant
//

import SwiftUI

struct ContextMenuView: View {
    
    @State private var backgroundColor: Color = .indigo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Swiftful Thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .foregroundStyle(.white)
        .padding(30)
        .background(backgroundColor.cornerRadius(30))
        .contextMenu(menuItems: {
            Button(action: {
                backgroundColor = .yellow
            }, label: {
                Label("Share post", systemImage: "flame.fill").labelStyle(.titleAndIcon)
            })

            Button(action: {
                backgroundColor = .red
            }, label: {
                Text("Report post")
            })

            Button(action: {
                backgroundColor = .green
            }, label: {
                Label {
                    Text("Like post")
                } icon: {
                    Image(systemName: "heart.fill")
                }.labelStyle(.titleAndIcon)
            })
        })
    }
}

#Preview {
    ContextMenuView()
}
