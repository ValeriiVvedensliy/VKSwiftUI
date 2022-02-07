//
//  NetworkFriendsVkService.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 07.02.2022.
//

import Foundation

protocol NetworkVkService {
  associatedtype data
  func loadData(completion: @escaping ([data]) -> Void)
}
