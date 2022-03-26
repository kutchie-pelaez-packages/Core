extension UnkeyedDecodingContainer {
    public mutating func decode(_ type: Array<Any>.Type) throws -> [Any] {
        var result = [Any]()
        while !isAtEnd {
            if try decodeNil() {
                continue
            } else if let bool = try? decode(Bool.self) {
                result.append(bool)
            } else if let double = try? decode(Double.self) {
                result.append(double)
            } else if let string = try? decode(String.self) {
                result.append(string)
            } else if let dictionary = try? decode(Dictionary<String, Any>.self) {
                result.append(dictionary)
            } else if let array = try? decode(Array<Any>.self) {
                result.append(array)
            }
        }

        return result
    }

    public mutating func decode(_ type: Dictionary<String, Any>.Type) throws -> [String: Any] {
        let nestedContainer = try self.nestedContainer(keyedBy: JSONCodingKey.self)

        return try nestedContainer.decode(type)
    }
}
