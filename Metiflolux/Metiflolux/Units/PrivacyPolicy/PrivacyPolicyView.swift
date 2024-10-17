//
//  PrivacyPolicyView.swift
//  Chainestery
//
//  Created by Andrii Momot on 17.08.2024.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @EnvironmentObject private var rootViewModel: RootContentView.RootContentViewModel
    
    @StateObject private var viewModel = PrivacyPolicyViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Asset.privacyBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Polityka prywatności")
                    .foregroundStyle(Colors.graphit.swiftUIColor)
                    .font(Fonts.Inter.bold.swiftUIFont(size: 30))
                
                Asset.privacyPhone.swiftUIImage
                    .resizable()
                    .scaledToFit()
                
                Rectangle()
                    .foregroundStyle(Colors.dipBlue.swiftUIColor)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .ignoresSafeArea(edges: .bottom)
                    .overlay {
                        VStack(spacing: 30) {
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    viewModel.showPrivacyPolicy.toggle()
                                }
                            } label: {
                                Text("Zapoznałem się z polityką prywatności")
                                    .foregroundStyle(.white)
                                    .font(Fonts.Inter.medium.swiftUIFont(size: 15))
                                    .underline()
                                    .padding(.horizontal)
                            }
                            
                            Button {
                                withAnimation {
                                    viewModel.isAgreed.toggle()
                                }
                            } label: {
                                ZStack {
                                    if viewModel.isAgreed {
                                        RoundedRectangle(cornerRadius: 5)
                                            .foregroundStyle(Colors.graphit.swiftUIColor)
                                            .scaledToFit()
                                            .frame(width: 27)
                                        
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundStyle(.white)
                                            .hidden(!viewModel.isAgreed)
                                    } else {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.white, lineWidth: 2)
                                            .scaledToFit()
                                            .frame(width: 27)
                                    }
                                }
                                .frame(width: 44, height: 44)
                            }
                            
                            Button {
                                viewModel.showMainFlow(rootViewModel: rootViewModel)
                            } label: {
                                ZStack {
                                    var color: Color {
                                        viewModel.isAgreed ? .white : .liteBlue
                                    }
                                    
                                    color
                                        .cornerRadius(14, corners: .allCorners)
                                    Text("Kontynuować")
                                        .foregroundStyle(Colors.dipBlue.swiftUIColor)
                                        .font(Fonts.Inter.bold.swiftUIFont(size: 18))
                                }
                                .frame(height: 49)
                                .padding(.horizontal, 80)
                            }
                            .disabled(!viewModel.isAgreed)
                            
                            Spacer()
                        }
                    }
            }
        }
        .sheet(isPresented: $viewModel.showPrivacyPolicy) {
            SwiftUIViewWebView(url: viewModel.privacyPolicyURL)
        }
    }
}

#Preview {
    PrivacyPolicyView()
}
