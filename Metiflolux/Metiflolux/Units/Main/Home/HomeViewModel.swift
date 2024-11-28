//
//  HomeViewModel.swift
//  Metiflolux
//
//

import Foundation

extension HomeView {
    final class ViewModel: ObservableObject {
        @Published var selectedType: HomeButton.ButtonType = .home(isSelected: true)
        @Published var projects: [ProjectModel] = []
        @Published var comments: [CommentModel] = []
        
        @Published var showProjectDetails = false
        var projectToShow: ProjectModel?
        
        @Published var showFAQ = false
        
        @Published var showCreateComment = false
        
        func getItems() {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.projects = DefaultsService.shared.projects.sorted(by: {$0.date > $1.date})
                self.comments = DefaultsService.shared.comments.sorted(by: {$0.date > $1.date})
            }
        }
        
        func handleProject(action: MyProjectsView.ViewAction) {
            switch action {
            case .onProject(let project):
                projectToShow = project
                showProjectDetails.toggle()
            case .onCreate:
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.selectedType = .flowerShop(isSelected: true)
                }
            }
        }
        
        func handleComments(action: CommentsListView.ViewAction) {
            switch action {
            case .onCreate:
                showCreateComment = true
            case .onDelete(let id):
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    if let index = DefaultsService.shared.comments.firstIndex(where: {
                        $0.id == id
                    }) {
                        DefaultsService.shared.comments.remove(at: index)
                        self.getItems()
                    }
                }
            }
        }
    }
}
