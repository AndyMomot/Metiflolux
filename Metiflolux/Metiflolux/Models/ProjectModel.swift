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
    
    var title: String
    var mainBudget: Int
    
    var flowersBudget, salariesBudget, renovationBudget, rentingBudget: Int?
    
    var costs: Int {
        (flowersBudget ?? .zero) + (salariesBudget ?? .zero) + (renovationBudget ?? .zero) + (rentingBudget ?? .zero)
    }
    
    var earnings: Int {
        mainBudget - costs
    }
}
