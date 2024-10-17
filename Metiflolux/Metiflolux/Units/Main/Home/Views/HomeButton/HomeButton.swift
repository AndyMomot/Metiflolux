//
//  HomeButton.swift
//  Metiflolux
//
//  Created by Andrii Momot on 17.10.2024.
//

import SwiftUI

struct HomeButton: View {
    var type: ButtonType
    var action: (ButtonType) -> Void
    
    @State private var buttonColor = Colors.dipBlue.swiftUIColor
    
    var body: some View {
        Button {
            onTap()
        } label: {
            ZStack {
                buttonColor
                    .cornerRadius(10, corners: [.topRight, .bottomRight])
                
                HStack(spacing: 20) {
                    Image(type.image)
                    
                    Text(type.title)
                        .foregroundStyle(.white)
                        .font(Fonts.Inter.bold.swiftUIFont(size: 17))
                        .lineLimit(2)
                        .minimumScaleFactor(0.6)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                .padding(.leading)
            }
        }
    }
}

private extension HomeButton {
    func onTap() {
        let duration = 0.3
        buttonColor = Colors.slateGray.swiftUIColor
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            buttonColor = Colors.dipBlue.swiftUIColor
            action(type)
        }
    }
}

extension HomeButton {
    enum ButtonType: String, Identifiable {
        case flowerShop, faq, analytics, notes
        
        var id: String {
            rawValue
        }
        
        var image: String {
            switch self {
            case .flowerShop:
                return Asset.homeFlower.name
            case .faq:
                return Asset.homeInfo.name
            case .analytics:
                return Asset.homeAnalitics.name
            case .notes:
                return Asset.homeDocs.name
            }
        }
        
        var title: String {
            switch self {
            case .flowerShop:
                return "Utworzenie kwiaciarni"
            case .faq:
                return "Kwiaty FAQ"
            case .analytics:
                return "Analityka"
            case .notes:
                return "Uwagi dla siebie"
            }
        }
    }
}

#Preview {
    HomeButton(type: .flowerShop) { _ in }
        .frame(width: 260, height: 50)
}
