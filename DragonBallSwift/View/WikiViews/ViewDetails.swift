//
//  SwiftUIView.swift
//  DragonBallSwift
//
//  Created by Raúl Gallego Alonso on 27/7/24.
//

import SwiftUI

struct ViewDetails: View {
    //Logica de reconocimiento de colores
    @State var crImages = CRImages()
    
    // Recibimos los datos de la API, no lo inicializamos.
    @State var Caracter: CharactersModel
    @Binding var LogoDB: String
    
    var body: some View {
        ZStack {
            
            //Esto crea el fondo de color con gradientes y el color por defecto de la App.
            RadialGradient(colors: [ Color("BackgroundColor")], center: .center, startRadius: 30, endRadius: 380)
                .ignoresSafeArea()
            
            ScrollView {
                Circle()
                    .frame(width: 300, height: 300)
                    .blur(radius: 90)
                    .foregroundStyle(crImages.mostVibrantColor)
                    .overlay{
                        AsyncImage(url: URL(string: Caracter.image)) { image in
                            image
                                .resizable()
                                .frame(width: 400, height: 400, alignment: .center)
                                .offset(y: 15) // Ponemos un 15, para bajar la imagen
                                .onAppear{
                                    if let uiImage = image.asUIImage() {
                                        crImages.detectColors(in: uiImage)
                                    }
                                }
                                .padding()
                            
                        } placeholder: {
                            ProgressView()
                        }
                    }.padding(.bottom, 40)
                HStack {
                    Text(Caracter.name).font(.custom("SaiyanSans", size: 30))
                        .bold()
                        .foregroundStyle(.yellow)
                    Spacer()
                    Image(LogoDB)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 90)
                    
                }
                .padding(.horizontal, 50)
                VStack {
                    Text(Caracter.description).font(.title3)
                        .foregroundStyle(.white)
                    
                }
                // Ponemos un tamaño de 30 adaptado para los bordes de la descripcion.
                .padding(30)
            }
        }
        
        
        
    }
}

#Preview {
    @State var mock = Mocks()
    
    @State var LogoDB = "DBLogo"
    return ViewDetails(Caracter: mock.character, LogoDB: $LogoDB)
    
    
    
    
}
