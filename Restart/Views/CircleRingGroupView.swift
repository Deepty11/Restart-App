//
//  CircleRingGroupView.swift
//  Restart
//
//  Created by Rehnuma Reza Deepty on 5/4/23.
//

import SwiftUI

extension ZStack {
    func animationModifier(_ isAnimating: Bool) -> some View {
        return self.blur(radius: isAnimating ? 0 : 10)
            .opacity(isAnimating ? 1 : 0)
            .scaleEffect(isAnimating ? 1 : 0.5)
            .animation(.easeIn(duration: 1), value: isAnimating)
    }
}
struct CircleRingGroupView: View {
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 20)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .animationModifier(isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
        
        
        
    }
}

struct CircleRingGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
                
            CircleRingGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
