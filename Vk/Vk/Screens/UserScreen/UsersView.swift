//
//  UsersView.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 16.01.2022.
//

import SwiftUI

struct UsersView: View {
  var body: some View {
    // ToDo Mock Data for Testing
    UsersAndGroupBuilder<Self> (image: "background_image", text: "Valerii Vvedeskyi")
  }
}


struct UsersView_Previews: PreviewProvider {
  static var previews: some View {
    UsersView()
  }
}
