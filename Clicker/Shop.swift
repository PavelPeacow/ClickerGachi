//
//  Shop.swift
//  Clicker
//
//  Created by Павел Кай on 17.03.2022.
//

import SwiftUI

struct Shop: View {
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    
    @Binding var HowCLicked : Int
    @Binding var power : Int
    
    
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.pink, Color.yellow]),
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        

        ScrollView(.vertical, showsIndicators: false) {
            
            
            let powersGachi: [GachiPowersModel] = Bundle.main.decode("gachiPower.json")

            ZStack() {
                
                backgroundGradient.ignoresSafeArea()
                
                VStack {
                    ForEach(powersGachi) { thing in
                        ShopThing(thing: thing, HowCLicked: $HowCLicked, power: $power)
                    }
                    Text("You have \(power) gachi power!")
                        .padding()
                    Text("You have \(HowCLicked) semen!")
                        .padding()
                }
            }
        }
    }
    
}

struct Shop_Previews: PreviewProvider {
    
    static var previews: some View {
        Shop(HowCLicked: .constant(0), power: .constant(1))
    }
}

