//
//  ImagesView.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 28.01.2022.
//

import SwiftUI
import QGrid

struct ImagesView: View {
  let images: [Photo]
  let name: String
  
  var body: some View {
    QGrid(images, columns: 3) {
      Image($0.image)
        .resizable()
        .scaledToFit()
        .clipShape(Circle())
        .shadow(color: .primary, radius: 5)
        .padding([.horizontal, .top], 7)
    }
  }
}
