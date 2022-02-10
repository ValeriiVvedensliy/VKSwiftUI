//
//  UsersAndGroupBuilder.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 16.01.2022.
//

import SwiftUI
import Kingfisher

struct UsersAndGroupBuilder<Content>: View where Content: View {
  var image: String
  var text: String
  @State var tapOnAvatar: Bool = false
  
  init(image: String, text: String) {
    self.image = image
    self.text = text
  }
  
  func animation() -> Animation {
      tapOnAvatar.toggle()
    return Animation
          .spring(response: 0.55, dampingFraction: 0.45, blendDuration: 0)
          .speed(2)
          .delay(0.075)
  }

  var body: some View {
    Group {
      HStack {
        KFImage(URL(string: self.image)!)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 60, height: 60, alignment: .center)
          .clipShape(Circle())
          .overlay(Circle().stroke(Color.black, lineWidth: 2))
          .padding(.leading, 14)
          .scaleEffect(tapOnAvatar ? 1.2 : 1)
          .onTapGesture {
            withAnimation(animation()) {
              tapOnAvatar.toggle()
            }
          }
        Text(self.text)
          .padding(.leading, 20)
        
        Spacer()
      }
    }
  }
}
