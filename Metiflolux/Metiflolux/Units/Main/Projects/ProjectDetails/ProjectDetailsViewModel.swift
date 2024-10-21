//
//  ProjectDetailsViewModel.swift
//  Metiflolux
//
//  Created by Andrii Momot on 20.10.2024.
//

import Foundation
import SwiftUI

extension ProjectDetailsView {
    final class ViewModel: ObservableObject {
        @Published var image: Image?
        
        @Published var mainBudget = 0
        @Published var costs = 0
        @Published var earnings = 0
        
        @Published var flowersBudget = ""
        @Published var salariesBudget = ""
        @Published var renovationBudget = ""
        @Published var rentingBudget = ""
        
        func setProject(_ project: ProjectModel) async {
            if let data = await ImageStorageManager().fetchImage(with: project.id),
               let uiImage = UIImage(data: data) {
                DispatchQueue.main.async { [weak self] in
                    self?.image = Image(uiImage: uiImage)
                }
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.mainBudget = project.mainBudget
                self.costs = project.costs
                self.earnings = project.earnings
                
                if let flowersBudget = project.flowersBudget {
                    self.flowersBudget = "\(flowersBudget)"
                }
                
                if let salariesBudget = project.salariesBudget {
                    self.salariesBudget = "\(salariesBudget)"
                }
                
                if let renovationBudget = project.renovationBudget {
                    self.renovationBudget = "\(renovationBudget)"
                }
                
                if let rentingBudget = project.rentingBudget {
                    self.rentingBudget = "\(rentingBudget)"
                }
            }
        }
        
        func updateBudget(for project: inout ProjectModel) {
            project.flowersBudget = Int(flowersBudget) ?? .zero
            project.salariesBudget = Int(salariesBudget) ?? .zero
            project.renovationBudget = Int(renovationBudget) ?? .zero
            project.rentingBudget = Int(rentingBudget) ?? .zero
            
            costs = project.costs
            earnings = project.earnings
        }
        
        func delete(projectId: String, completion: @escaping () -> Void) {
            DispatchQueue.main.async {
                if let index = DefaultsService.shared.projects.firstIndex(where: {
                    $0.id == projectId
                }) {
                    DefaultsService.shared.projects.remove(at: index)
                    completion()
                }
            }
        }
        
        func save(project: ProjectModel, completion: @escaping () -> Void) {
            DispatchQueue.main.async {
                if let index = DefaultsService.shared.projects.firstIndex(where: {
                    $0.id == project.id
                }) {
                    DefaultsService.shared.projects[index] = project
                    completion()
                }
            }
        }
    }
}
