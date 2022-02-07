//
//  NetworkPhotoVk.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 07.02.2022.
//

import Foundation
import Alamofire
import SwiftyJSON


class NetworkPhotoVk: NetworkVkService {
  typealias data = Photo
  private let friendId: Int
  
  public init(friendId: Int) {
    self.friendId = friendId
  }
  
  func loadData(completion: @escaping ([Photo]) -> Void) {
    let path = "photos.getAll"
    let parameters: Parameters = ["owner_id" : friendId,
                                  "access_token" : UserSession.shared.token ?? "",
                                  "v" : UserSession.shared.versionAPI,
                                  "extended" : "1"]
    UserSession.shared.session.request(UserSession.shared.host + path, method: .get, parameters: parameters).response {response in
        switch response.result {
        case .failure(let error):
            print(error)
          break;
        case .success(let data):
          guard let data = data else { return }
          let json = JSON(data)
          let response = json["response"]
          let photoJSONs = response["items"].arrayValue
          let photos: [Photo] = photoJSONs.map { model in
            let image = model["sizes"].arrayValue.last?["url"] ?? ""
            let id = model["id"]

            return Photo(
              id: "\(id)",
              image: "\(image)"
            )
          }
          completion(photos)
          break;
        }
    }
  }
}
