//
//  HomeView.swift
//  Restart
//
//  Created by Rehnuma Reza on 1/4/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Text("HomeView")
                .font(.largeTitle)
            Button("Restart") {
                isOnboardingViewActive = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
