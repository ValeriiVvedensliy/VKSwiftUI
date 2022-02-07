//
//  News.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 08.02.2022.
//

import Foundation

class News: Identifiable {
   var uuid: String { id }
   var id: String = ""
   var textNews: String = ""
   var likes: String = "0"
   var comments: String = "0"
   var reposts: String = "0"
   var imageNews: String = ""
  
  init(
    id: String,
    textNews: String,
    imageNews: String,
    likes: String,
    comments: String,
    reposts: String
  ) {
    self.id = id
    self.textNews = textNews
    self.imageNews = imageNews
    self.likes = likes
    self.comments = comments
    self.reposts = reposts
  }
}
