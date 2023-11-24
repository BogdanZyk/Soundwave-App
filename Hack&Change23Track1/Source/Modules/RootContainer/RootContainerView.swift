//
//  RootContainerView.swift
//  Hack&Change23Track1
//
//  Created by Bogdan Zykov on 24.11.2023.
//

import SwiftUI

struct RootContainerView: View {
    @StateObject private var userManager = UserManager()
    var body: some View {
        TabView {
            RoomsView()
                .tabItem {
                    Label("Rooms", systemImage: "list.dash")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .environmentObject(userManager)
    }
}

struct RootContainerView_Previews: PreviewProvider {
    static var previews: some View {
        RootContainerView()
    }
}
