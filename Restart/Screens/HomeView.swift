//
//  HomeView.swift
//  Restart
//
//  Created by Rehnuma Reza on 1/4/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
    
            // MARK: - HEADER
            Spacer()
            ZStack {
                CircleRingGroupView(ShapeColor: .gray,
                                    ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation.easeInOut(duration: 3)
                            .repeatForever()
                        , value: isAnimating)
            }
            // MARK: - CENTER
            Text("The time that leads to mastery is dependent on the intensity of our focus")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding()
            // MARK: -  FOOTER
            Spacer()
            
            Button {
                withAnimation {
                    isOnboardingViewActive = true
                }
                
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                // to delay the start of the animation on appear of the screen
                isAnimating = true
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
