//
//  ContentView.swift
//  Clicker
//
//  Created by Павел Кай on 17.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.pink, Color.yellow]),
        startPoint: .top, endPoint: .bottom)
    
    let gachiSounds = ["Oh yes sir",
                       "Spank",
                       "You like that",
                       "You ripped my fucking pants",
                       "woop",
                       "FUCKYOU",
                       "Mmmmh"
    
    ]
    
    @Binding var HowCLicked : Int
    @Binding var power : Int
    
    @State private var IsCLicked = false
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
//                                Image("Ahegao")
//                                    .resizable()
//                                    .background(.black)
//                                    .blur(radius: 0.9)
//                                    .opacity(0.7)
                
                backgroundGradient.ignoresSafeArea()
                
                VStack {
                    
                    VStack {
                        Text("Эдвард Антышов")
                        Text("Серега СС")
                        Text("Дима Оса")
                        Text("Дамир Гейний")
                        Text("Максимилиум Сурс")
                    }
                    .padding(.bottom, 30)
                    
                    
                    
                    Text("You have \(power) gachi power!")
                        .bold()
                        .background(.orange)
                        .font(.title2)
                        
                    Button(action: {
                        
                        HowCLicked += power
                        playSound(sound: gachiSounds.randomElement()!, type: "mp3")
                        
                    }, label: {
                        Image("Aniki")
                            .resizable()
                            .frame(width: 160, height: 160)
                        
                        
                    })
                        .padding(.vertical, 20)
                        
                    
                    Button(action: {
                        IsCLicked = true
                        
                    }, label: {
                        Image(systemName: "questionmark")
                            .foregroundColor(.black)
                            .frame(width: 80, height: 80)
                            .background(.orange)
                            .font(.largeTitle)
                    })
                        .alert("You have \(HowCLicked) semen!", isPresented: $IsCLicked, actions: {
                            Button("Hooray") {playSound(sound: gachiSounds[6], type: "mp3")}
                            Button("FUCK YOU", role: .cancel) {playSound(sound: gachiSounds[5], type: "mp3")}
                        })
                }
                
            } 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(HowCLicked: .constant(0), power: .constant(1))
            
    }
}
