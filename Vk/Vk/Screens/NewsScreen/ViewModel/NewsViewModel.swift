//
//  NewsViewModel.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 08.02.2022.
//

import Foundation

class NewsViewModel: ObservableObject {
  let service: NetworkNewsVk
  @Published var news: [News] = []
  
  init(service: NetworkNewsVk) {
    self.service = service
  }
  
  public func fetchData() {
    service.loadData {[weak self] result in
      self?.news = result
    }
  }
}
