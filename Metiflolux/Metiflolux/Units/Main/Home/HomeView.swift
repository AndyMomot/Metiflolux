//
//  HomeView.swift
//  Metiflolux
//
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Asset.homeBg.swiftUIImage
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        VStack(spacing: 33) {
                            HomeMenuView(selection: $viewModel.selectedType)
                            
                            switch viewModel.selectedType {
                            case .home:
                                MyProjectsView(projects: viewModel.projects) { action in
                                    withAnimation {
                                        viewModel.handleProject(action: action)
                                    }
                                }
                            case .flowerShop:
                                CreateProjectView {
                                    switchToHome()
                                }
                                .padding()
                            case .faq:
                                EmptyView()
                            case .analytics:
                                ProjectStatisticListView(projects: viewModel.projects)
                                    .padding()
                            case .notes:
                                if viewModel.showCreateComment {
                                    CreateCommentView { // on create
                                        withAnimation {
                                            viewModel.showCreateComment = false
                                            viewModel.getItems()
                                        }
                                    }
                                    .padding()
                                } else {
                                    CommentsListView(comments: viewModel.comments) { action in
                                        withAnimation {
                                            viewModel.handleComments(action: action)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .scrollIndicators(.never)
                }
                .ignoresSafeArea(edges: .top)
            }
            .onAppear {
                withAnimation {
                    viewModel.getItems()
                }
            }
            .navigationDestination(isPresented: $viewModel.showProjectDetails) {
                if let project = viewModel.projectToShow {
                    ProjectDetailsView(project: project) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation {
                                viewModel.getItems()
                            }
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $viewModel.showFAQ) {
                FAQView()
            }
        }
        .onChange(of: viewModel.selectedType) { newValue in
            switch newValue {
            case .faq:
                viewModel.showFAQ.toggle()
            default:
                break
            }
        }
    }
}

private extension HomeView {
    func switchToHome() {
        DispatchQueue.main.async {
            viewModel.selectedType = .home(isSelected: true)
            viewModel.getItems()
        }
    }
}

#Preview {
    HomeView()
}
