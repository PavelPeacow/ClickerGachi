//
//  Bar.swift
//  Clicker
//
//  Created by Павел Кай on 19.03.2022.
//

import SwiftUI

struct BackgroundHP: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 14)
                .frame(width: 280, height: 15)
                .foregroundColor(.red)
                .overlay(Color.black.opacity(0.4)).cornerRadius(14)
            
            RoundedRectangle(cornerRadius: 14)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 280, height: 15)
                .foregroundColor(.yellow)
        }
    }
}
 

struct Bar: View {
    
    
    
    
    @State var startHP: Double = 1000000000
    var bossHP: Double = 1000000000
    
    @State var loh = Image("van")
    
    
    
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.pink, Color.yellow]),
        startPoint: .top, endPoint: .bottom)
    
    @Binding var power: Int
    
    
    var body: some View {
        
        ZStack {
            backgroundGradient.ignoresSafeArea()
            VStack {
                GeometryReader{ (proxy : GeometryProxy) in
                    VStack(alignment: .trailing) {

                        loh
                            .resizable()
                            .frame(width: 330, height: 480)
                            .onTapGesture {
                                startHP -= Double(power)
                                if startHP == 0 {
                                    playSound(sound: "FUCKYOU", type: "mp3")
                                }
                            }
                        
                    }
                    .frame(width: proxy.size.width, height:proxy.size.height , alignment: .top) //
                }
                
                
                ProgressView(value: startHP, total: bossHP)
                    .progressViewStyle(BackgroundHP())
                    .padding(.top, 20)
                
                VStack {
                    
                    Text("GREAT LORD OF THE GYM")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Button("KIll !!!  tipa") {
                        startHP -= startHP
                        if startHP == 0 {
                            playSound(sound: "FUCKYOU", type: "mp3")
                            loh = Image("mmmm")
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
}

struct Bar_Previews: PreviewProvider {
    
    static var previews: some View {
        Bar(power: .constant(1))
    }
}
