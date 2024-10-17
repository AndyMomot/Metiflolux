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
                        
                    }
                }
                .scrollIndicators(.never)
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    HomeView()
}
