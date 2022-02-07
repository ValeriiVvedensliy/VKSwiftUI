//
//  NewsView.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 27.01.2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct NewsView: View {
  @ObservedObject var viewModel = NewsViewModel(service: NetworkNewsVk())
  
  var body: some View {
    List(viewModel.news) { news in
      VStack {
        KFImage(URL(string: news.imageNews))
          .resizable()
          .scaledToFit()
          .frame(width: 200, height: 300)
        
        Text(verbatim: news.textNews)
        HStack {
          Image("repost")
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
          Text(verbatim: "\(news.reposts)")
          Spacer()
          Image("comments")
            .resizable()
            .scaledToFit()
            .frame(width: 43, height: 43)
          Text(verbatim: "\(news.comments)")
          Spacer()
          Image("heart")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
          Text(verbatim: "\(news.likes)")
        }
      }
    }
    .onAppear {
        viewModel.fetchData()
    }
    .navigationBarBackButtonHidden(true)
  }
}
