//
//  ContentView.swift
//  ej04AinaraTarjeta
//
//  Created by user193642 on 2/20/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userInfo: UserInfo //recoge datos de la clase
    
    var body: some View {
        //vista que hace la navegación entre pantallas
        TabView {
            //pantalla del formulario
            FormView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Formulaio")
                }
            //condición que no muestra la pantalla de la tarjeta hasta que no estén los datos correctamente
            if !userInfo.name.isEmpty && !userInfo.surname.isEmpty && !userInfo.job.isEmpty && (userInfo.phone.count == 9) && userInfo.email.contains("@") && !userInfo.address.isEmpty {
                //pantalla de la tarjeta
                CardView()
                    .tabItem {
                        Image(systemName: "person.crop.rectangle")
                        Text("Tarjeta")
                    }
            }
        }
    }
}

//previsualización de la navegación entre pantallas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
