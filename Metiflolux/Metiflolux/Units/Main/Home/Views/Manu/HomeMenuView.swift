//
//  HomeMenuView.swift
//  Metiflolux
//
//

import SwiftUI

struct HomeMenuView: View {
    
    @Binding var selection: HomeButton.ButtonType
    
    @State private(set) var buttonTypes: [HomeButton.ButtonType] = [
        .home(isSelected: true),
        .flowerShop(isSelected: false),
        .faq(isSelected: false),
        .analytics(isSelected: false),
        .notes(isSelected: false)
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
                                selection = selectedType
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
        .onChange(of: selection) { newValue in
            withAnimation {
                updateSelection(for: newValue)
            }
        }
    }
}

private extension HomeMenuView {
    func updateSelection(for selectedType: HomeButton.ButtonType) {
        
        DispatchQueue.main.async {
            buttonTypes = [
                .home(isSelected: false),
                .flowerShop(isSelected: false),
                .faq(isSelected: false),
                .analytics(isSelected: false),
                .notes(isSelected: false)
            ]
            
            if let index = buttonTypes.firstIndex(where: { $0.id == selectedType.id }) {
                switch selectedType {
                case .home:
                    buttonTypes[index] = .home(isSelected: true)
                case .flowerShop:
                    buttonTypes[index] = .flowerShop(isSelected: true)
                case .faq:
                    buttonTypes[index] = .faq(isSelected: true)
                case .analytics:
                    buttonTypes[index] = .analytics(isSelected: true)
                case .notes:
                    buttonTypes[index] = .notes(isSelected: true)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.gray
            .ignoresSafeArea()
        HomeMenuView(selection: .constant(.home(isSelected: true)))
            .frame(height: 413)
    }
}
