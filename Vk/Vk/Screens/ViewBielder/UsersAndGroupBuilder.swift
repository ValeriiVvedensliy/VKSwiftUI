//
//  UsersAndGroupBuilder.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 16.01.2022.
//

import SwiftUI

struct UsersAndGroupBuilder<Content>: View where Content: View {
  var image: String
  var text: String
  
  init(image: String, text: String) {
    self.image = image
    self.text = text
  }
  
  var body: some View {
    Group {
      HStack {
        Image(self.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 60, height: 60, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 2))
            .padding(.leading, 24)
 
        Text(self.text)
          .padding(.leading, 20)

        Spacer()
      }
    }
  }
}
