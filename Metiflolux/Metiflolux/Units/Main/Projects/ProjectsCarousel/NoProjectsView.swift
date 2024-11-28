//
//  NoProjectsView.swift
//  Metiflolux
//
//

import SwiftUI

struct NoProjectsView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Moje projekty")
                .foregroundStyle(.white)
                .font(Fonts.Inter.bold.swiftUIFont(size: 30))
            
            HStack(alignment: .top, spacing: 10) {
                Asset.homeFlower.swiftUIImage
                    .padding(.vertical, 7)
                    .padding(.horizontal, 42)
                    .background(Colors.dipBlue.swiftUIColor)
                    .cornerRadius(20, corners: .allCorners)
                
                Text("Aby Twoje projekty pojawiły się tutaj, musisz utworzyć je w tej sekcji")
                    .foregroundStyle(Colors.slateGray.swiftUIColor)
                    .font(Fonts.Inter.bold.swiftUIFont(size: 15))
            }
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        NoProjectsView()
            .padding(.horizontal)
    }
}
