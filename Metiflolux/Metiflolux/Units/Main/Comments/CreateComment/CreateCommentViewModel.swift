//
//  CreateCommentViewModel.swift
//  Metiflolux
//
//

import Foundation
import UIKit.UIImage

extension CreateCommentView {
    final class ViewModel: ObservableObject {
        @Published var image = UIImage()
        @Published var showImagePicker = false
        
        @Published var name = ""
        @Published var note = ""
        
        @Published var isValidFields = false
        
        func validateFields() {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.isValidFields = self.image != UIImage() &&
                self.image.jpegData(compressionQuality: 1) != nil &&
                !self.name.isEmpty &&
                !self.note.isEmpty
            }
        }
        
        func createProject(completion: @escaping () -> Void) {
            DispatchQueue.main.async { [weak self] in
                guard let self, self.isValidFields else { return }
                let model = CommentModel(name: self.name, note: self.note)
                DefaultsService.shared.comments.append(model)
                
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
                
                self.name = ""
                self.note = ""
                
                self.isValidFields = false
            }
        }
    }
}
