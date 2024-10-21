//
//  CommentModel.swift
//  Metiflolux
//
//  Created by Andrii Momot on 21.10.2024.
//

import Foundation

struct CommentModel: Identifiable, Codable {
    private(set) var id = UUID().uuidString
    private(set) var date = Date()
    
    var name, note: String
}
