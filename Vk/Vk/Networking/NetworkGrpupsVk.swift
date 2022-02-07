//
//  NetworkGrpupsVk.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 07.02.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkGrpupsVk: NetworkVkService {
  typealias data = Groups
  
  func loadData(completion: @escaping ([Groups]) -> Void) {
    let path = "groups.get"
    let parameters: Parameters = ["access_token" : UserSession.shared.token ?? "",
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
          let groupJSONs = response["items"].arrayValue
          let groups = groupJSONs.map { group in
            Groups(
              id: "\(group["id"])",
              groupName: "\(group["name"])",
              groupLogo: "\(group["photo_100"])"
            )
          }
          completion(groups)
          break;
        }
    }
  }
}
