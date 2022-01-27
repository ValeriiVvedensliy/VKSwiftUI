//
//  UsersView.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 16.01.2022.
//

import SwiftUI

struct UsersView: View {
  let users =  [
    User(id: "1", fullName: "Valerii Vvedeskyi", avatar: "valerii", images: [
      Photo(id: "1", image: "valerii"),
      Photo(id: "2", image: "liza"),
      Photo(id: "3", image: "ira"),
      Photo(id: "4", image: "artem"),
      Photo(id: "5", image: "katty")
    ]),
    User(id: "2", fullName: "Liza Upatova", avatar: "liza", images: [
      Photo(id: "1", image: "valerii"),
      Photo(id: "2", image: "liza"),
      Photo(id: "3", image: "ira"),
      Photo(id: "4", image: "artem"),
      Photo(id: "5", image: "katty")
    ]),
    User(id: "3", fullName: "Irusya Barabash", avatar: "ira", images: [
      Photo(id: "1", image: "valerii"),
      Photo(id: "2", image: "liza"),
      Photo(id: "3", image: "ira"),
      Photo(id: "4", image: "artem"),
      Photo(id: "5", image: "katty")
    ]),
    User(id: "4", fullName: "Artem Chernomor", avatar: "artem", images: [
      Photo(id: "1", image: "valerii"),
      Photo(id: "2", image: "liza"),
      Photo(id: "3", image: "ira"),
      Photo(id: "4", image: "artem"),
      Photo(id: "5", image: "katty")
    ]),
    User(id: "5", fullName: "Katty Pometun", avatar: "katty", images: [
      Photo(id: "1", image: "valerii"),
      Photo(id: "2", image: "liza"),
      Photo(id: "3", image: "ira"),
      Photo(id: "4", image: "artem"),
      Photo(id: "5", image: "katty")
    ])
  ]
  
  var body: some View {
    // ToDo Mock Data for Testing
    
    List(users) { user in
      NavigationLink(destination: ImagesView(images: user.images, name: user.fullName)) {
        UsersAndGroupBuilder<Self> (image: user.avatar, text: user.fullName)
      }
    }
    .navigationBarBackButtonHidden(true)
  }
}


struct UsersView_Previews: PreviewProvider {
  static var previews: some View {
    UsersView()
  }
}
