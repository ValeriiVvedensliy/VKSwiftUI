//
//  Friend.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 06.02.2022.
//


class Friend: Identifiable {
  var uuid: String { ownerID }
  var userName: String = ""
  var userAvatar: String  = ""
  var ownerID: String  = ""
  
  init(userName:String, userAvatar:String, ownerID:String) {
    self.userName = userName
    self.userAvatar = userAvatar
    self.ownerID = ownerID
  }
}
