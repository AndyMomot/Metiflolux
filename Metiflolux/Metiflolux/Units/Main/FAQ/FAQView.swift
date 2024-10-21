//
//  FAQView.swift
//  Metiflolux
//
//  Created by Andrii Momot on 21.10.2024.
//

import SwiftUI

struct FAQView: View {
    @StateObject private var viewModel = ViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Asset.faqBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Beck
                BackButton(title: "Powrót")
                    .padding(.horizontal)
                
                // Title
                Text("Kwiaty FAQ")
                    .foregroundStyle(.white)
                    .font(Fonts.Inter.bold.swiftUIFont(size: 30))
                    .padding(.horizontal)
                
//                ScrollView {
                    
                    // Buttons
                HStack(spacing: .zero) {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(viewModel.faqItems) { item in
                                let isSelected = item.title == viewModel.selectedItem.title
                                
                                Button {
                                    withAnimation {
                                        viewModel.selectedItem = item
                                    }
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .foregroundStyle(isSelected ? Colors.dipBlue.swiftUIColor : .white)
                                            .cornerRadius(22, corners: [.topLeft, .bottomLeft])
                                        
                                        Image(item.image)
                                            .resizable()
                                            .scaledToFit()
                                            .padding(.trailing, 20)
                                            .padding(.vertical, 16)
                                    }
                                    .padding(.leading, 7)
                                }
                                
                            }
                        }
                        .padding(.vertical, 30)
                        .background(.white)
                        .cornerRadius(40, corners: [.topRight, .bottomRight])
                        .frame(width: bounds.width * 0.38)
                    }
                    .scrollIndicators(.never)
                    
                    
                    Spacer(minLength: 20)
                    
                    // Info
                    ScrollView {
                        VStack(alignment: .leading, spacing: 40) {
                            Text(viewModel.selectedItem.title)
                                .foregroundStyle(.white)
                                .font(Fonts.Inter.bold.swiftUIFont(size: 23))
                            
                            Text(viewModel.selectedItem.text)
                                .foregroundStyle(.white)
                                .font(Fonts.Inter.light.swiftUIFont(size: 15))
                            
                            Spacer()
                        }
                        .padding(.trailing, 16)
                    }
                }
            }
        }
    }
}

#Preview {
    FAQView()
}
