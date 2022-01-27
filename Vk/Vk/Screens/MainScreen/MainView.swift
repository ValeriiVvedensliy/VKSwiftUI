//
//  MainView.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 23.01.2022.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    TabView {
      UsersView()
      .tabItem {
        Label("Friends", systemImage: "person")
      }

      GroupView()
        .tabItem {
          Label("Group", systemImage: "square.and.pencil")
        }
      
      NewsView()
        .tabItem {
          Label("News", systemImage: "note.text")
        }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
