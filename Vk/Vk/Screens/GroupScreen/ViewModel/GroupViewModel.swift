//
//  GroupViewModel.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 07.02.2022.
//

import Foundation

class GroupViewModel: ObservableObject {
  let service: NetworkGrpupsVk
  @Published var groups: [Groups] = []
  
  init(service: NetworkGrpupsVk) {
    self.service = service
  }
  
  public func fetchFriends() {
    service.loadData {[weak self] result in
      self?.groups = result
    }
  }
}
