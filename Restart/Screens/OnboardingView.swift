//
//  OnboardingView.swift
//  Restart
//
//  Created by Rehnuma Reza on 1/4/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(edges: .all)
            
            
            VStack(spacing: 60) {
                Spacer()
                //MARK: - HEADER
                VStack(spacing: 0){
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                It's not how much we love
                But how much love we put into giving
                """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }
                //MARK: - CENTER
                ZStack{
                    ZStack{
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 20)
                            .frame(width: 260, height: 260, alignment: .center)
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 80)
                            .frame(width: 260, height: 260, alignment: .center)
                    }
                    Image("character-1")
                        .resizable() // if not resizable() modifier called, no change in image size will be refleacted
                        .scaledToFit()
                    
                }
                
                Spacer()
                //MARK: - FOOTER
                ZStack{
                    //MARK: -Parts of the component
                    // 1. STatic background
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. Call-to-action (static)
                    
                    Text("Get Started")
                        .foregroundColor(.white)
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .offset(x:20)
                    // 3. Capsule shape ( dynamic width)
                    
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        Spacer()
                        
                    }
                    
                    // 4. Draggable circle shape
                    
                    HStack {
                        ZStack{
                            Capsule()
                                .fill(Color("ColorRed"))
                            Capsule()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                            
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .onTapGesture {
                            isOnboardingViewActive = false
                        }
                        
                        Spacer()
                    }
                    
                    
                    
                }
                .frame(height: 80, alignment: .center)
                .padding()
            }
           
            
        }
    }

}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
