//
//  ImageViewModel.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 07.02.2022.
//

import Foundation

class ImageViewModel: ObservableObject {
  let service: NetworkPhotoVk
  @Published var photos: [Photo] = []
  
  init(service: NetworkPhotoVk) {
    self.service = service
  }
  
  public func fetchData() {
    service.loadData {[weak self] result in
      self?.photos = result
    }
  }
}
