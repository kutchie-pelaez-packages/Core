import Foundation

extension String {
    public var attributed: NSAttributedString {
        NSAttributedString(string: self)
    }

    public var utf8Data: Data {
        safeUndefinedIfNil(
            data(using: .utf8),
            Data(),
            "Failed to convert string \(self) to utf8 data"
        )
    }

    public var camelCaseChunks: [String] {
        unicodeScalars.reduce("") {
            let separator = CharacterSet.uppercaseLetters.contains($1) ? " " : ""

            return $0 + separator + String($1)
        }
        .split(separator: " ")
        .map(String.init)
    }

    public func jsonObject<T: Decodable>(decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = data(using: .utf8) else { return nil }

        return try? decoder.decode(T.self, from: data)
    }

    public mutating func replace(_ replacements: [String: String]) {
        for key in replacements.keys {
            guard let value = replacements[key] else { continue }

            self = replacingOccurrences(
                of: key,
                with: value
            )
        }
    }

    public func replacing(_ replacements: [String: String]) -> String {
        var result = self
        result.replace(replacements)

        return result
    }
}
