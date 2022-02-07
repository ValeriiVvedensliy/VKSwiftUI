//
//  ImagesView.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 28.01.2022.
//

import SwiftUI
import QGrid
import Kingfisher

struct ImagesView: View {
  @ObservedObject var viewModel: ImageViewModel
  
  init(viewModel: ImageViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    QGrid(viewModel.photos, columns: 3) {
      KFImage(URL(string: $0.image)!)
        .resizable()
        .scaledToFit()
        .clipShape(Circle())
        .shadow(color: .primary, radius: 5)
        .padding([.horizontal, .top], 7)
    }.onAppear {
      viewModel.fetchData()
    }
  }
}
