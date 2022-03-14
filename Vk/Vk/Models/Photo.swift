//
//  Photo.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 28.01.2022.
//

import Foundation

struct Photo: Identifiable, Hashable {
  var uuid: String { id }
  let id: String
  let image: String
}
