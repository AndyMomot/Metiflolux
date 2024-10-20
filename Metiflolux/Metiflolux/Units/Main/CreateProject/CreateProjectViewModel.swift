//
//  CreateProjectViewModel.swift
//  Metiflolux
//
//  Created by Andrii Momot on 19.10.2024.
//

import Foundation
import UIKit.UIImage

extension CreateProjectView {
    final class ViewModel: ObservableObject {
        @Published var image = UIImage()
        @Published var showImagePicker = false
        
        @Published var projectName = ""
        @Published var projectBudget = ""
        
        @Published var isValidFields = false
        
        func validateFields() {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.isValidFields = self.image != UIImage() &&
                self.image.jpegData(compressionQuality: 1) != nil &&
                !self.projectName.isEmpty &&
                Int(self.projectBudget) ?? .zero > .zero
            }
        }
        
        func createProject(completion: @escaping () -> Void) {
            DispatchQueue.main.async { [weak self] in
                guard let self, self.isValidFields else { return }
                let model = ProjectModel(
                    title: self.projectName,
                    mainBudget: Int(self.projectBudget) ?? .zero
                )
                
                DefaultsService.shared.projects.append(model)
                
                if let data = image.jpegData(compressionQuality: 1) {
                    let iSManager = ImageStorageManager()
                    iSManager.saveImage(data: data, for: model.id)
                }
                
                self.clean()
                completion()
            }
        }
        
        private func clean() {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.image = UIImage()
                self.showImagePicker = false
                
                self.projectName = ""
                self.projectBudget = ""
                
                self.isValidFields = false
            }
        }
    }
}
