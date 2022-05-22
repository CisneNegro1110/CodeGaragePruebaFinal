//
//  ListView.swift
//  CodeGaragePruebaFinal (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 22/05/22.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var vm : ViewModelList
    var body: some View {
        List {
            ForEach($vm.lista, id: \.id) { $data in
                HStack {
                    Text(data.description)
                    Spacer()
                    Button(action: {
                        vm.updateList(note: $data)
                    }, label: {
                        withAnimation{
                            Image(systemName: data.isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                        }
                    })
                    .foregroundColor(.green)
                }
                .swipeActions(edge: .trailing) {
                    Button(action: {
                        withAnimation {
                            vm.removeNote(id: data.id)
                        }
                    }, label: {
                        Label("Borrar", systemImage: "trash.fill")
                    })
                    .tint(.red)
                }
            }
        }
    }
}
