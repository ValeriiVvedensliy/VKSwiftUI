import Foundation
import Alamofire
import SwiftyJSON

public class UserSession: NSObject {
  static var shared: UserSession = {
    let instance = UserSession()
    
    return instance
  }()
  
  public let session: Session = {
    let config = URLSessionConfiguration.default
    config.timeoutIntervalForRequest = 60
    let session = Session(configuration: config)
    return session
  }()
  
  public let host = "https://api.vk.com/method/"
  public let versionAPI = "5.131"
  
  public var token: String!
  public var userID: String!
  
  private override init() {
    super.init()
  }
}
