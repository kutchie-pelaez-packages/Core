import Foundation

extension KeyedDecodingContainer {
    public func decode(
        _ type: Dictionary<String, Any>.Type,
        forKey key: K
    ) throws -> [String: Any] {
        let container = try self.nestedContainer(
            keyedBy: JSONCodingKey.self,
            forKey: key
        )

        return try container.decode(type)
    }

    public func decodeIfPresent(
        _ type: Dictionary<String, Any>.Type,
        forKey key: K
    ) throws -> [String: Any]? {
        guard
            contains(key),
            !(try decodeNil(forKey: key))
        else {
            return nil
        }

        return try decode(
            type,
            forKey: key
        )
    }

    public func decode(
        _ type: Array<Any>.Type,
        forKey key: K
    ) throws -> [Any] {
        var container = try self.nestedUnkeyedContainer(forKey: key)

        return try container.decode(type)
    }

    public func decodeIfPresent(
        _ type: Array<Any>.Type,
        forKey key: K
    ) throws -> [Any]? {
        guard
            contains(key),
            !(try decodeNil(forKey: key))
        else {
            return nil
        }

        return try decode(
            type,
            forKey: key
        )
    }

    public func decode(_ type: Dictionary<String, Any>.Type) throws -> [String: Any] {
        var result = [String: Any]()

        for key in allKeys {
            if let bool = try? decode(Bool.self, forKey: key) {
                result[key.stringValue] = bool
            } else if let string = try? decode(String.self, forKey: key) {
                result[key.stringValue] = string
            } else if let int = try? decode(Int.self, forKey: key) {
                result[key.stringValue] = int
            } else if let double = try? decode(Double.self, forKey: key) {
                result[key.stringValue] = double
            } else if let dictionary = try? decode(Dictionary<String, Any>.self, forKey: key) {
                result[key.stringValue] = dictionary
            } else if let array = try? decode(Array<Any>.self, forKey: key) {
                result[key.stringValue] = array
            }
        }

        return result
    }
}
