//
//  UsersView.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 16.01.2022.
//

import SwiftUI

struct UsersView: View {
  
  @ObservedObject var viewModel: UsersViewModel
  
  init(viewModel: UsersViewModel) {
    self.viewModel = viewModel
  }
  var body: some View {
    List(viewModel.friends) { user in
      NavigationLink(destination: ImagesView(viewModel: ImageViewModel(
        service: NetworkPhotoVk(friendId: Int(user.ownerID) ?? 0)))) {
        UsersAndGroupBuilder<Self> (image: user.userAvatar , text: user.userName)
      }
    }
      .onAppear {
      viewModel.fetchFriends()
    }
    .navigationBarBackButtonHidden(true)
  }
}
