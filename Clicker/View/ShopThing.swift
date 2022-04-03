//
//  ShopThing.swift
//  Clicker
//
//  Created by Павел Кай on 18.03.2022.
//

import SwiftUI

struct ShopThing: View {
    
    let thing: GachiPowersModel
    
    @State private var isBuy = false
    @State private var backgroundColor = Color.red
    @State private  var iterator = 0
    
    @Binding var HowCLicked : Int
    @Binding var power : Int
    
    var body: some View {
        
        
        
        HStack() {
            
           
            
            Button(action: {
                isBuy.toggle()
                
            }, label: {
                Text("\(thing.name)")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .background(Color.black)
                    .multilineTextAlignment(.center)
                    .cornerRadius(50)
            })
            
                .alert("You wanna buy \(thing.name)? , For \(thing.price) semen, Power \(thing.power)" , isPresented: $isBuy, actions: {
                    Button("Yeah") {
                        if HowCLicked >= thing.price {
                            HowCLicked -= thing.price
                            power += thing.power
                            playSound(sound: "Mmmmh", type: "mp3")
                            iterator += 1
                        } else {
                            playSound(sound: "FUCKYOU", type: "mp3")
                        }
                        
                    }
                    Button("Buy all") {
                        while HowCLicked >= thing.price {
                            power += thing.power
                            HowCLicked -= thing.price
                            iterator += 1
                        }
                    }
                    Button("Not yet", role: .cancel) {
                        playSound(sound: "FUCKYOU", type: "mp3")
                    }
                })
            
            VStack {
                Text("How many you bought - \(iterator)")
            }
            
        }
        
    }
}


struct ShopThing_Previews: PreviewProvider {
    static let things: [GachiPowersModel] = Bundle.main.decode("gachiPower.json")
    
    static var previews: some View {
        ShopThing(thing: things[0], HowCLicked: .constant(0), power: .constant(1))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
