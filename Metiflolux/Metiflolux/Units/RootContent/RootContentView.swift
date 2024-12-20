//
//  RootContentView.swift
//  Libarorent
//
//

import SwiftUI

struct RootContentView: View {
    @StateObject private var viewModel = RootContentViewModel()
    var preloaderView = PreloaderView()
    
    var body: some View {
        Group {
            if viewModel.showPreloader {
                preloaderView
            } else {
                switch viewModel.viewState {
                case .onboarding:
                    OnboardingViewTabView()
                        .environmentObject(viewModel)
                case .main:
                    HomeView()
                        .environmentObject(viewModel)
                }
            }
        }
        .onAppear {
            self.viewModel.getFlow()
        }
        .onReceive(preloaderView.onDidLoad) {
            withAnimation {
                DispatchQueue.main.async {
                    self.viewModel.showPreloader.toggle()
                }
            }
        }
    }
}

#Preview {
    RootContentView()
}
