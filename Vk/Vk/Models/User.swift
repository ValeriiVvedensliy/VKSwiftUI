//
//  User.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 28.01.2022.
//

import Foundation

struct User: Identifiable {
  var uuid: String { id }
  let id: String
  let fullName: String
  let avatar: String
  let images: [Photo]
}
