//
//  GroupView.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 27.01.2022.
//

import Foundation
import SwiftUI

struct GroupView: View {

  @ObservedObject var viewModel = GroupViewModel(service: NetworkGrpupsVk())
  
  var body: some View {
    List(viewModel.groups) { group in
        UsersAndGroupBuilder<Self> (image: group.groupLogo , text: group.groupName)
    }
    .onAppear {
        viewModel.fetchFriends()
    }
    .navigationBarBackButtonHidden(true)
  }
}
