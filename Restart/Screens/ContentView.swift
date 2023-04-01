//
//  ContentView.swift
//  Restart
//
//  Created by Rehnuma Reza on 24/3/23.
//

import SwiftUI

struct ContentView: View {
    // when the app launches, the first screen to be displayed is the
    // Onboarding screen
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
