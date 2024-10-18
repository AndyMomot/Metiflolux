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
                    HomeMenuView { selectedType in
                        DispatchQueue.main.async {
                            viewModel.selectedType = selectedType
                        }
                    }
                    
                    switch viewModel.selectedType {
                    case .home:
                        EmptyView()
                    case .flowerShop:
                        EmptyView()
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

#Preview {
    HomeView()
}
