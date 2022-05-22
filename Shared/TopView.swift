//
//  ContentView.swift
//  Shared
//
//  Created by Jesús Francisco Leyva Juárez on 20/05/22.
//

import SwiftUI

struct TopView: View {
    @State var descriptionText: String = ""
    @ObservedObject var vm : ViewModelList
    var body: some View {
        VStack {
            HStack {
                TextField("Agregar nuevo elemento a la lista", text: $descriptionText)
                    .textFieldStyle(.roundedBorder)
                Button("Crear") {
                    vm.saveNote(description: self.descriptionText)
                    descriptionText = ""
                }
                .buttonStyle(.bordered)
                .tint(.blue)
            }.padding()
        }
    }
    
}

