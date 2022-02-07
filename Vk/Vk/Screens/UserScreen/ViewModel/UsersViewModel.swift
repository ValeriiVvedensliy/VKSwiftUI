//
//  UsersViewModel.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 06.02.2022.
//

import Foundation

class UsersViewModel: ObservableObject {
  let service: NetworkFriendsVk
  @Published var friends: [Friend] = []
  
  init(service: NetworkFriendsVk) {
    self.service = service
  }
  
  public func fetchFriends() {
    service.loadData {[weak self] result in
      self?.friends = result
    }
  }
}
