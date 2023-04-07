//
//  OnboardingView.swift
//  Restart
//
//  Created by Rehnuma Reza on 1/4/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State var buttonOffset: CGFloat = 0
    @State var isAnimating: Bool = false
    @State var imageOffset: CGSize = .zero // CGSize(width: 0, height: 0)
    @State var indicatorOpacity: Double = 1.0
    @State var textTitle: String = "Share"
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(edges: .all)
            
            
            VStack(spacing: 60) {
                Spacer()
                //MARK: - HEADER
                VStack(spacing: 0){
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle)
                    
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
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1),
                           value: isAnimating)
                //MARK: - CENTER
                ZStack{
                    CircleRingGroupView(ShapeColor: .white,
                                        ShapeOpacity: 0.2)
                    .offset(x: imageOffset.width * -1)
                    .blur(radius: abs(imageOffset.width / 5))
                    .animation(.easeOut(duration: 1),
                               value: imageOffset)
                    
                    Image("character-1")
                        .resizable() // if not resizable() modifier called, no change in image size will be refleacted
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5),
                                   value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(imageOffset.width / 20))
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                if abs(imageOffset.width) <= 150 {
                                    imageOffset = gesture.translation
                                    
                                    withAnimation(.linear(duration: 0.25)){
                                        textTitle = "Give."
                                        indicatorOpacity = 0
                                    }
                                    
                                }
                            })
                                .onEnded({ _ in
                                    imageOffset = .zero
                                    
                                    withAnimation(.linear(duration: 0.25)){
                                        textTitle = "Share."
                                        indicatorOpacity = 1
                                    }
                                })
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)
                        .overlay(alignment: .bottom) {
                            Image(systemName: "arrow.left.and.right.circle")
                                .font(.system(size: 44, weight: .ultraLight))
                                .foregroundColor(.white)
                                .offset(y: 100)
                                .opacity(isAnimating ? 1 : 0)
                                .animation(.easeOut(duration: 1).delay(2),
                                           value: isAnimating)
                                .opacity(indicatorOpacity)
                        }
                        
                        
                    
                    
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
                        .offset(x: 20)
                    // 3. Capsule shape ( dynamic width)
                    
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
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
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation (
                                        Animation.easeOut(duration: 1.5)) {
                                            if buttonOffset > buttonWidth / 2 {
                                                buttonOffset = buttonWidth - 80
                                                isOnboardingViewActive = false
                                            } else {
                                                buttonOffset = 0
                                            }
                                        }
                                    
                                    
                                })
                        )
                        
                        Spacer()
                    }
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1),
                           value: isAnimating)
            }
        }
        .onAppear {
            isAnimating = true
        }
    }

}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
