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
        VStack(spacing: 20){
            Text("OnboardingView")
            Button("Start") {
            isOnboardingViewActive = false
            }.padding(10)
            .border(.black)
            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
