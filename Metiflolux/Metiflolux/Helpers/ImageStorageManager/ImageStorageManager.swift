//
//  ImageStorageManager.swift
//  Metiflolux
//
//

import Foundation

struct ImageStorageManager {
    func saveImage(data: Data, for id: String) {
        DispatchQueue.main.async {
            let path = FileManagerService.Keys.image(id: id).path
            FileManagerService().saveFile(data: data, forPath: path)
        }
    }
    
    func fetchImage(with id: String) async -> Data? {
        let path = FileManagerService.Keys.image(id: id).path
        guard let imageData = FileManagerService().getFile(forPath: path)
        else {
            return nil
        }
        
        return imageData
    }
}
