//
//  HomeView.swift
//  Metiflolux
//
//  Created by Andrii Momot on 17.10.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Asset.homeBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    HomeMenuView(selection: $viewModel.selectedType)
                    
                    switch viewModel.selectedType {
                    case .home:
                        EmptyView()
                    case .flowerShop:
                        CreateProjectView {
                            switchToHome()
                        }
                            .padding()
                    case .faq:
                        EmptyView()
                    case .analytics:
                        EmptyView()
                    case .notes:
                        EmptyView()
                    }
                    
                }
                .scrollIndicators(.never)
            }
            .ignoresSafeArea(edges: .top)
        }
        .onAppear {
            withAnimation {
                viewModel.getProjects()
            }
        }
    }
}

private extension HomeView {
    func switchToHome() {
        DispatchQueue.main.async {
            viewModel.selectedType = .home(isSelected: true)
            viewModel.getProjects()
        }
    }
}

#Preview {
    HomeView()
}
