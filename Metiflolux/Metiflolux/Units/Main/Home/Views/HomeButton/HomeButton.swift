//
//  HomeButton.swift
//  Metiflolux
//
//

import SwiftUI

struct HomeButton: View {
    var type: ButtonType
    var action: (ButtonType) -> Void
    
    var body: some View {
        var selectionColor: Color {
            type.isSelected ? Colors.slateGray.swiftUIColor : Colors.dipBlue.swiftUIColor
        }
        
        Button {
            action(type)
        } label: {
            ZStack {
                selectionColor
                    .cornerRadius(10, corners: [.topRight, .bottomRight])
                
                HStack(spacing: 20) {
                    Image(type.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18)
                    
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

extension HomeButton {
    enum ButtonType: Identifiable, Equatable {
        case home(isSelected: Bool)
        case flowerShop(isSelected: Bool)
        case faq(isSelected: Bool)
        case analytics(isSelected: Bool)
        case notes(isSelected: Bool)
        
        var id: String {
            title
        }
        
        var image: String {
            switch self {
            case .home:
                return Asset.homeIcone.name
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
            case .home:
                return "Dom"
            }
        }
        
        var isSelected: Bool {
            switch self {
            case .flowerShop(let isSelected):
                return isSelected
            case .faq(let isSelected):
                return isSelected
            case .analytics(let isSelected):
                return isSelected
            case .notes(let isSelected):
                return isSelected
            case .home(let isSelected):
                return isSelected
            }
        }
    }
}

#Preview {
    HomeButton(type: .flowerShop(isSelected: false)) { _ in }
        .frame(width: 260, height: 50)
}
