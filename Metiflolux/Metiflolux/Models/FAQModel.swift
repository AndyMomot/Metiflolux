//
//  FAQModel.swift
//  Libarorent
//
//

import Foundation

struct FAQModel: Identifiable {
    private(set) var id = UUID().uuidString
    var image, title, text: String
}
