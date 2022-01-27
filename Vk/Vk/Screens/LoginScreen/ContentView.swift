//
//  ContentView.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 27.01.2022.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @State private var isShouldGoToFrieds: Bool = false
    
    var body: some View {
        
        NavigationView {
            HStack {
                LoginView(isAuthorized: $isShouldGoToFrieds)
                
                NavigationLink(destination: MainView(), isActive: $isShouldGoToFrieds) {
                    EmptyView()
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
