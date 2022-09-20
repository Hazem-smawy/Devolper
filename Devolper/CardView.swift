//
//  CardView.swift
//  Devolper
//
//  Created by hazem smawy on 9/20/22.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTY
    @State private var fadeIn :Bool = false
    @State private var moveDown: Bool = false
    @State private var moveUp :Bool = false
    @State private var showAlert:Bool = false
    var haptic = UIImpactFeedbackGenerator(style: .heavy)
    
    var card:Card
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity( fadeIn ? 1.0 : 0.0)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
            }
            .offset(y: moveDown ? -218 : -300)
            
            Button {
                playSound(sound: "sound-chime", type: "mp3")
                haptic.impactOccurred()
                showAlert.toggle()
            } label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .accentColor(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(.title.weight(.medium))
                        .accentColor(.white)
                        
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing)
                        .clipShape(Capsule())
                        .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                )
                
            }
            .offset(y: moveUp ? 210 : 300)

        }//:ZStack
       
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear(perform: {
            withAnimation(.linear(duration: 1.2)) {
                fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                moveUp.toggle()
                moveDown.toggle()
            }
        })
        .alert(isPresented: $showAlert){
            Alert (title: Text(card.title),
                   message:Text(card.message),
                   dismissButton: .default(Text("Ok"))   
                )
        }
    }
}
// MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardsData[1])
            .previewLayout(.sizeThatFits)
    }
}
