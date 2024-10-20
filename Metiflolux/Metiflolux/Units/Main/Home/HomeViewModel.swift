//
//  HomeViewModel.swift
//  Metiflolux
//
//  Created by Andrii Momot on 17.10.2024.
//

import Foundation

extension HomeView {
    final class ViewModel: ObservableObject {
        @Published var selectedType: HomeButton.ButtonType = .home(isSelected: true)
        @Published var projects: [ProjectModel] = []
        
        @Published var showProjectDetails = false
        var projectToShow: ProjectModel?
        
        func getProjects() {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.projects = DefaultsService.shared.projects
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
    }
}
