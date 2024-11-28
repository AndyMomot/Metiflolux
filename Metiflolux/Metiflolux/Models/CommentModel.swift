//
//  CommentModel.swift
//  Metiflolux
//
//

import Foundation

struct CommentModel: Identifiable, Codable {
    private(set) var id = UUID().uuidString
    private(set) var date = Date()
    
    var name, note: String
}
