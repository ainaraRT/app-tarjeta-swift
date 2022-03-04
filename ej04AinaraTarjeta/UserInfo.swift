//
//  UserInfo.swift
//  ej04AinaraTarjeta
//
//  Created by user193642 on 2/20/22.
//

import Foundation

class UserInfo: ObservableObject {
    //datos que se almacenan para poder ponerlos en las pantallas
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var job: String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    @Published var address: String = ""
}
