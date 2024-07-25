//
//  WikiView.swift
//  DragonBallSwift
//
//  Created by Jacob Aguilar on 24-07-24.
//

import SwiftUI

struct WikiView: View {
    
    let menuItem = [
        ItemMenu(name: "Dragon Ball", imegenName: "DB Logo", destination: AnyView(ViewDB())),
        ItemMenu(name: "Dragon Ball Z", imegenName: "Z Logo", destination: AnyView(ViewDZ())),
        ItemMenu(name: "Dragones", imegenName: "LogoDragones", destination: AnyView(ViewDragons()))
    ]
    
    var body: some View {
        
        //Todo envuelto en un NavigationStack, para poder navegar a la vista seleccionada a través de un Navigation Link
        NavigationStack {
            VStack {
                Text("Personajes")
                    .font(.title)
                    .foregroundStyle(.accent)
                    .fontWeight(.bold)
                
                ScrollView {
                    ForEach(menuItem) { item in
                        NavigationLink(destination: item.destination) {
                            HStack {
                                Text(item.name).font(.title3).bold()
                                    .foregroundStyle(.accent)
                                
                                Spacer()
                                
                                Image(item.imegenName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 70)
                            }
                            .padding()
                            .background(Color("CardColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                            )
                            .cornerRadius(12)
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                    }
                }
            }
            .background(Color("BackgroundColor"))
        }
    }
}

#Preview {
    WikiView()
}