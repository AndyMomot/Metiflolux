//
//  OnboardingView.swift
//  Goobeltoin
//
//

import SwiftUI

struct OnboardingView: View {
    var item: OnboardingView.OnboardingItem
    @Binding var currentPageIndex: Int
    
    @EnvironmentObject private var rootViewModel: RootContentView.RootContentViewModel
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            Image(item.bgImage)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                Asset.onboardLogo.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 160)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.title)
                        .font(Fonts.Inter.bold.swiftUIFont(size: 18))
                    
                    Text(item.text)
                        .font(Fonts.Inter.regular.swiftUIFont(size: 15))
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 34)
                
                Button {
                    withAnimation {
                        currentPageIndex = item.next.rawValue
                    }
                    
                    if item == .third {
                        viewModel.showPrivacyPolicy.toggle()
                    }
                } label: {
                    Asset.onboardBtnBg.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            HStack {
                                Text("Dalej")
                                Image(systemName: "chevron.right")
                            }
                            .foregroundStyle(.white)
                            .font(Fonts.Inter.bold.swiftUIFont(size: 18))
                        }
                }
                .padding(.horizontal, 80)
                .padding(.bottom, 80)
                .shadow(color: Colors.dipBlue.swiftUIColor.opacity(0.3),
                        radius: 5)

            }
        }
        .fullScreenCover(isPresented: $viewModel.showPrivacyPolicy) {
            PrivacyPolicyView()
        }
    }
}

#Preview {
    OnboardingView(item: .first, currentPageIndex: .constant(0))
}
