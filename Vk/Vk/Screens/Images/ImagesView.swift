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
  
  let columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
  var body: some View {
    ScrollView(.vertical) {
      LazyVGrid(columns: columns, alignment: .center) {
        ForEach(viewModel.photos, id: \.self) { item in
          KFImage(URL(string: item.image)!)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .shadow(color: .primary, radius: 5)
            .padding([.horizontal, .top], 7)
        }
      }
    }.onAppear { viewModel.fetchData() }
  }
}
