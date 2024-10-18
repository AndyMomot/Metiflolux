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
        
        func getProjects() {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.projects = DefaultsService.shared.projects
            }
        }
    }
}
