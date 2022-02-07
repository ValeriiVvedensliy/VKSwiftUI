//
//  Group.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 07.02.2022.
//

class Groups: Identifiable {
  var uuid: String { id }
  var id: String = ""
  var groupName: String = ""
  var groupLogo: String  = ""
  
  init(id: String, groupName: String, groupLogo: String) {
    self.id = id
    self.groupName = groupName
    self.groupLogo = groupLogo
  }
}
