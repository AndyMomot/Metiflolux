//
//  HomeMenuView.swift
//  Metiflolux
//
//  Created by Andrii Momot on 17.10.2024.
//

import SwiftUI

struct HomeMenuView: View {
    
    var action: (HomeButton.ButtonType) -> Void
    
    init(action: @escaping (HomeButton.ButtonType) -> Void) {
        self.action = action
    }
    
    private var buttonTypes: [HomeButton.ButtonType] = [
        .flowerShop, .faq, .analytics, .notes
    ]
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(99, corners: .bottomRight)
            
            VStack(spacing: 33) {
                Text("Menu główne")
                    .foregroundStyle(Colors.slateGray.swiftUIColor)
                    .font(Fonts.Inter.bold.swiftUIFont(size: 30))
                    .lineLimit(1)
                    .multilineTextAlignment(.trailing)
                    .minimumScaleFactor(0.7)
                    .offset(y: 20)
                
                HStack(spacing: .zero) {
                    VStack(spacing: 25) {
                        ForEach(buttonTypes) { type in
                            HomeButton(type: type) { selectedType in
                                action(selectedType)
                            }
                            .frame(minWidth: bounds.width * 0.6)
                            .frame(height: 50)
                        }
                    }
                    
                    Asset.homeTree.swiftUIImage
                        .resizable()
                        .scaledToFit()
                }
            }
            .padding(.top, 60)
            .padding(.bottom, 15)
        }
    }
}

#Preview {
    ZStack {
        Color.gray
            .ignoresSafeArea()
        HomeMenuView {_ in}
            .frame(height: 413)
    }
}
