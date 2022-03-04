//
//  FormView.swift
//  ej04AinaraTarjeta
//
//  Created by user193642 on 2/20/22.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var userInfo: UserInfo //recoge datos de la clase
    
    var body: some View {
        //vista en vertical
        VStack {
            Text("Tus datos")
                .font(.largeTitle)
                .bold()
                .padding(20)
                .multilineTextAlignment(.center)
            //formulario
            Form {
                TextField("Nombre", text: $userInfo.name)
                TextField("Apellido", text: $userInfo.surname)
                TextField("Puesto de trabajo", text: $userInfo.job)
                //vista que se separa el formulario en otra sección
                Section {
                    TextField("Número de teléfono", text: $userInfo.phone)
                        .textContentType(.telephoneNumber)
                    TextField("Correo electrónico", text: $userInfo.email)
                        .textContentType(.emailAddress)
                    TextField("Dirección", text: $userInfo.address)
                }
            }
        }
    }
}

//previsualización de la pantalla del formulario
struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
