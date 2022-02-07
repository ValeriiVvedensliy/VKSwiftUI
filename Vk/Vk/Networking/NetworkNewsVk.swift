import Foundation
import Alamofire
import SwiftyJSON


class NetworkNewsVk: NetworkVkService {
  typealias data = News
  
  func loadData(completion: @escaping ([News]) -> Void) {
    let path = "newsfeed.get"
    let parameters: Parameters = ["access_token" : UserSession.shared.token ?? "",
                                  "v" : UserSession.shared.versionAPI,
                                  "filters" : "post",
                                  "count": "15"]
    UserSession.shared.session.request(UserSession.shared.host + path, method: .get, parameters: parameters).response {response in
        switch response.result {
        case .failure(let error):
            print(error)
          break;
        case .success(let data):
          guard let data = data else { return }
          let json = JSON(data)
          let response = json["response"]
          let newsJSONs = response["items"].arrayValue
          let news: [News] = newsJSONs.map { model in
            let id = model["post_id"]
            let image = model["attachments"].arrayValue.first?["photo"]["sizes"].arrayValue.last?["url"] ?? ""
            let reposts = model["reposts"]["count"]
            let comments = model["comments"]["count"]
            let likes = model["likes"]["count"]
  
            return News(
              id: "\(id)",
              textNews: "\(model["text"])",
              imageNews: "\(image)",
              likes: "\(likes)",
              comments: "\(comments)",
              reposts: "\(reposts)"
            )
          }
          completion(news)
          break;
        }
    }
  }
}
