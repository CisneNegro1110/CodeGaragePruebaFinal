//
//  ListViewModel.swift
//  CodeGaragePruebaFinal (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 20/05/22.
//

import Foundation
import SwiftUI
import Combine

class ViewModelList: ObservableObject {
    @Published var lista: [modelList] = []
    private let userDefaults: UserDefaults = .standard
    
    init() {
        lista = getAllNotes()
    }
    
    func saveNote(description: String) {
        let newNote = modelList(description: description)
        lista.insert(newNote, at: 0)
        encodeAndSaveAllNotes()
        lista = getAllNotes()
    }
    
    func encodeAndSaveAllNotes() {
        if let encode = try? JSONEncoder().encode(lista) {
            userDefaults.set(encode, forKey: "Lista")
        }
    }
    
    func getAllNotes() -> [modelList] {
        if let listData = userDefaults.object(forKey: "Lista") as? Data {
            if let decodeList = try? JSONDecoder().decode([modelList].self, from: listData) {
                return decodeList
            }
        }
        return []
    }
    
    func removeNote(id: String) {
        lista.removeAll(where: { $0.id == id })
        encodeAndSaveAllNotes()
    }
    
    func updateList(note: Binding<modelList>) {
        note.wrappedValue.isChecked = !note.wrappedValue.isChecked
        encodeAndSaveAllNotes()
    }
}
