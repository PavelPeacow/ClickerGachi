//
//  BossOfTHEGYM.swift
//  Clicker
//
//  Created by Павел Кай on 21.03.2022.
//

import SwiftUI

struct BossOfTHEGYM: View {
    
    
    @Binding var power : Int
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BossOfTHEGYM_Previews: PreviewProvider {
    static var previews: some View {
        BossOfTHEGYM(power: .constant(1))
    }
}
