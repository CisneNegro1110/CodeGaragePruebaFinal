//
//  ListaModel.swift
//  CodeGaragePruebaFinal (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 20/05/22.
//

import Foundation

struct modelList: Codable {
    let id: String
    let description: String
    var isChecked: Bool
    
    init(id: String = UUID().uuidString, isChecked: Bool = false, description: String) {
        self.id = id
        self.description = description
        self.isChecked = isChecked
    }
}
