//
//  Tabs.swift
//  Clicker
//
//  Created by Павел Кай on 17.03.2022.
//

import SwiftUI



struct Tabs: View {
    
    @State private var HowCLicked = 0
    @State private var power = 1
    
    var body: some View {
        
        TabView {
           
            ContentView(HowCLicked: $HowCLicked, power: $power)
                .tabItem {
                    Text("GYM")
                    Image(systemName: "figure.stand")
                    
                }
            
            Shop(HowCLicked: $HowCLicked, power: $power)
                .tabItem {
                    Text("Shop")
                    Image(systemName: "pin")
                        
                }
            
            Bar(power: $power)
                .tabItem({
                    Text("Bar")
                    Image(systemName: "person.2.circle")
                    
                })
        }
        .accentColor(.purple)  
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
