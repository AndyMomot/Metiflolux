//
//  ProjectModel.swift
//  Metiflolux
//
//  Created by Andrii Momot on 18.10.2024.
//

import Foundation

struct ProjectModel: Identifiable, Codable {
    private(set) var id = UUID().uuidString
    private(set) var date = Date()
    
    var mainBudjet: Int
    var title: String
    
    var flowersBudjet, salariesBudjet, renovationBudjet, rentingBudjet: Int?
    
    var costs: Int {
        (flowersBudjet ?? .zero) + (salariesBudjet ?? .zero) + (renovationBudjet ?? .zero) + (rentingBudjet ?? .zero)
    }
    
    var earnings: Int {
        mainBudjet - costs
    }
}
