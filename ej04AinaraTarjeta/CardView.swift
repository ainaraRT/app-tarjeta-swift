//
//  CardView.swift
//  ej04AinaraTarjeta
//
//  Created by user193642 on 2/20/22.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var userInfo: UserInfo //recoge los datos de la clase
    @State var color = Color("blueColor") //variable la cual se podrá cambiar el color
    @State var flip = true //variable para mostrar la información al girar la tarjeta
    var selected = AnyView(Circle().stroke(Color.black, lineWidth: 3)) //variable que hace una vista círculo para seleccionar el botón del color seleccionado
    var selectedBlack = AnyView(Circle().stroke(Color.blue, lineWidth: 3)) //variable que hace una vista círculo para seleccionar el botón del color seleccionado
    
    var body: some View {
        //vista vertical
        VStack {
            Text("Tu tarjeta personalizada")
                .font(.largeTitle)
                .bold()
                .padding(20)
                .multilineTextAlignment(.center)
            Text("Color de la tarjeta")
                .font(.headline)
                .padding(.top, 10)
            //scrollview para mostrar todas las opciones de colores
            ScrollView(.horizontal) {
                //vista horizontal
                HStack {
                    //vista la cual se muestran las vistas una encima de la otra
                    ZStack {
                        Circle()
                            .foregroundColor(Color("redColor"))
                            .onTapGesture {
                                //al pulsar en el círculo, se almacena el color en la variable color
                                self.color = Color("redColor")
                            }
                        //condición que muestra la vista del otro circulo para hacer que está seleccionado este color
                        if color == Color("redColor") {
                            selected
                        }
                    }
                    ZStack {
                        Circle()
                            .foregroundColor(Color("greenColor"))
                            .onTapGesture {
                                self.color = Color("greenColor")
                            }
                        if color == Color("greenColor") {
                            selected
                        }
                    }
                    ZStack {
                        Circle()
                            .foregroundColor(Color("blueColor"))
                            .onTapGesture {
                                self.color = Color("blueColor")
                            }
                        if color == Color("blueColor") {
                            selected
                        }
                    }
                    ZStack {
                        Circle()
                            .foregroundColor(Color("yellowColor"))
                            .onTapGesture {
                                self.color = Color("yellowColor")
                            }
                        if color == Color("yellowColor") {
                            selected
                        }
                    }
                    ZStack {
                        Circle()
                            .foregroundColor(Color("purpleColor"))
                            .onTapGesture {
                                self.color = Color("purpleColor")
                            }
                        if color == Color("purpleColor") {
                            selected
                        }
                    }
                    ZStack {
                        Circle()
                            .foregroundColor(Color("blackColor"))
                            .onTapGesture {
                                self.color = Color("blackColor")
                            }
                        if color == Color("blackColor") {
                            selectedBlack
                        }
                    }
                }.frame(width: 350, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .padding(.leading, 10)
            }.padding(.bottom, 20)
            ZStack {
                //vista de la tarjeta
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .foregroundColor(color)
                    .frame(width: 350, height: 250)
                    .overlay(RoundedRectangle(cornerRadius: 40, style: .continuous).stroke(Color.black, lineWidth: 3))
                    .shadow(radius: 10)
                    .padding()
                    .scaledToFill()
                    //animación de la tarjeta para que gire
                    .rotation3DEffect(
                        .degrees(flip ? 0 : 180),
                        axis: (x: 0, y: 1, z: 0))
                    .onTapGesture {
                        //al pulsar la tarjeta se almacena el resultado en la variable flip
                        self.flip.toggle()
                    }.animation(.default)
                //si la variable está en true muestra la estructura de la cara frontal
                if flip == true {
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .overlay(Circle().stroke(Color.black, lineWidth: 3))
                                .frame(width: 75, height: 75, alignment: .leading)
                                
                            Text("\(userInfo.name.prefix(1).uppercased())")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        //condición que muestra el texto en blanco si se selecciona el color negro en la tarjeta
                        if color == Color("blackColor") {
                            frontInfo(nameInfo: "\(userInfo.name.capitalized) \(userInfo.surname.capitalized)", jobInfo: "\(userInfo.job.capitalized)")
                                .foregroundColor(.white)
                        } else {
                            frontInfo(nameInfo: "\(userInfo.name.capitalized) \(userInfo.surname.capitalized)", jobInfo: "\(userInfo.job.capitalized)")
                        }
                        
                    }.frame(width: 325, height: 225)
                //si la variable está en false, muestra la estructura de la cara trasera
                } else {
                    if color == Color("blackColor") {
                        flipInfo(phoneInfo: "\(userInfo.phone)", emailInfo: "\(userInfo.email.lowercased())", addressInfo: "\(userInfo.address.capitalized)")
                            .foregroundColor(.white)
                            .frame(width: 325, height: 225)
                    } else {
                        flipInfo(phoneInfo: "\(userInfo.phone)", emailInfo: "\(userInfo.email.lowercased())", addressInfo: "\(userInfo.address.capitalized)")
                            .frame(width: 325, height: 225)
                    }
                }
            }
            Spacer()
        }.padding()
    }
}

//estructura que recoge y ordena los datos en la cara frontal
struct frontInfo: View {
    var nameInfo = ""
    var jobInfo = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(nameInfo)
                .font(.title2)
                .fontWeight(.bold)
            Text(jobInfo)
                .font(.headline)
                .fontWeight(.medium)
        }.padding()
    }
}

//estructura que recoge y ordena los datos en la cara trasera
struct flipInfo: View {
    var phoneInfo = ""
    var emailInfo = ""
    var addressInfo = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack {
                Image(systemName: "phone.fill")
                Text(phoneInfo)
            }
            HStack {
                Image(systemName: "message.fill")
                Text(emailInfo)
            }
            HStack {
                Image(systemName: "mappin")
                Text(addressInfo)
            }
        }
    }
}

//previsualización de la pantalla
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
