//
//  SpacerView.swift
//  PracticeSwiftUIBootcamp
//
//  Created by raghuvamsi ayapilla on 12/3/25.
//

import SwiftUI

struct SpacerView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "xmark")
                Spacer()
                Image(systemName: "gear")
            }
            Spacer()
            Rectangle()
                .frame(height: 55)
        }
    }
}

#Preview {
    SpacerView()
}
