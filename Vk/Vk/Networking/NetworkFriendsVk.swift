import Foundation
import Alamofire
import SwiftyJSON


class NetworkFriendsVk: NetworkVkService {
  typealias data = Friend
  
  func loadData(completion: @escaping ([Friend]) -> Void) {
    let path = "friends.get"
    let parameters: Parameters = ["access_token" : UserSession.shared.token ?? "",
                                  "v" : UserSession.shared.versionAPI,
                                  "fields" : "nickname, domain, photo_100"]
    UserSession.shared.session.request(UserSession.shared.host + path, method: .get, parameters: parameters).response {response in
        switch response.result {
        case .failure(let error):
            print(error)
          break;
        case .success(let data):
          guard let data = data else { return }
          let json = JSON(data)
          let response = json["response"]
          let friendJSONs = response["items"].arrayValue
          let friends = friendJSONs.map { model in
            Friend(
              userName: "\(model["first_name"])  \(model["last_name"])",
              userAvatar: "\(model["photo_100"])",
              ownerID: "\(model["id"])"
            )
          }
          completion(friends)
          break;
        }
    }
  }
}
