import Foundation

extension URLSession {
    public static var sessionWithoutCaching: URLSession {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.requestCachePolicy = .reloadIgnoringLocalCacheData
        sessionConfiguration.urlCache = nil

        return URLSession(configuration: sessionConfiguration)
    }
}
