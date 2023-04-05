//
//  CircleRingGroupView.swift
//  Restart
//
//  Created by Rehnuma Reza Deepty on 5/4/23.
//

import SwiftUI

struct CircleRingGroupView: View {
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 20)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
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
