//
//  DynamicHeightTextField.swift
//  Chainestery
//
//

import SwiftUI

struct DynamicHeightTextField: View {
    var title: String
    var placeholder: String = "Napisz tekst"
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundStyle(.white)
                .font(Fonts.Inter.light.swiftUIFont(size: 13))
            
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.white)
                
                TextEditor(text: $text)
                    .foregroundStyle(.black)
                    .font(Fonts.Inter.regular.swiftUIFont(size: 13))
                    .padding()
                
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundStyle(Colors.silver.swiftUIColor)
                        .font(Fonts.Inter.light.swiftUIFont(size: 13))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 26)
                        .allowsHitTesting(false)
                }
            }
            .cornerRadius(20, corners: .allCorners)
        }
    }
}

#Preview {
    ZStack {
        Color.gray
        DynamicHeightTextField(
            title: "Uwaga do projektu",
            text: .constant(""))
        .frame(maxHeight: 117)
        .padding()
    }
}
