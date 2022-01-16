import Foundation

extension Data {
    public var jsonDictionary: [String: Any] {
        let jsonObject = try? JSONSerialization.jsonObject(
            with: self,
            options: .empty
        )

        return safeUndefinedIfNil(
            jsonObject as? [String: Any],
            [:],
            "Failed to get json dictionary"
        )
    }

    public func jsonObject<T: Decodable>(decoder: JSONDecoder = JSONDecoder()) throws -> T {
        try decoder.decode(
            T.self,
            from: self
        )
    }
}
