//
//  NextButton.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct NextButton: View {
    var imageName: String?
    var title: String?
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Colors.dipBlue.swiftUIColor
                HStack(spacing: 8) {
                    
                    if let imageName {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 15)
                    }
                    
                    if let title {
                        Text(title)
                            .foregroundStyle(.white)
                            .font(Fonts.Inter.bold.swiftUIFont(size: 18))
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.8)
                    }
                }
            }
            .cornerRadius(14, corners: .allCorners)
            .shadow(radius: 5, y: 5)
        }
    }
}

#Preview {
    ZStack {
        Color.gray
        NextButton(imageName: Asset.plus.name, title: "Komputeryrerererer") {}
            .frame(width: 265, height: 49)
    }
}
