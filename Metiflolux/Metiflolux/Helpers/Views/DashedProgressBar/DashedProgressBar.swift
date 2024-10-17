//
//  DashedProgressBar.swift
//  Metiflolux
//
//  Created by Andrii Momot on 17.10.2024.
//

import SwiftUI

struct DashedProgressBar: View {
    
    @Binding var progress: Int
    var maxValue: Int
    var backgroundColor: Color
    var foregroundColor: Color
    
    var body: some View {
        let range = (0..<maxValue)
        HStack(spacing: 10) {
            ForEach(range, id: \.self) { index in
                let shouldHide = progress < (index + 1)
                
                Rectangle()
                    .fill(foregroundColor)
                    .frame(height: 10)
                    .opacity(shouldHide ? 0 : 1)
            }
        }
        .background(backgroundColor)
        .onChange(of: progress) { newValue in
            withAnimation {
                if progress > maxValue {
                    self.progress = maxValue
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.gray
            .ignoresSafeArea()
        DashedProgressBar(
            progress: .constant(1),
            maxValue: 10,
            backgroundColor: .white,
            foregroundColor: Colors.dipBlue.swiftUIColor)
        .frame(height: 11)
            .padding(.horizontal)
    }
}
