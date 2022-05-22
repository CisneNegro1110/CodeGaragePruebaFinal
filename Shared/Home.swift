//
//  Home.swift
//  CodeGaragePruebaFinal (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 20/05/22.
//

import SwiftUI

struct Home: View {
    @StateObject var vmList = ViewModelList()
    var body: some View {
        NavigationView {
            VStack {
                TopView(vm: vmList)
                ListView(vm: vmList)
            }
            .navigationTitle("Lista de compras")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
