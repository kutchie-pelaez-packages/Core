import Foundation

extension String {
    public var attributed: NSAttributedString {
        NSAttributedString(string: self)
    }

    public var data: Data {
        safeUndefinedIfNil(
            data(using: .utf8),
            Data(),
            "Failed to convert string \(self) to utf8 data"
        )
    }

    public var camelCaseChunks: [String] {
        unicodeScalars.reduce("") {
            let letters = CharacterSet.uppercaseLetters
            let digits = CharacterSet.decimalDigits
            let set = letters.union(digits)
            let separator = set.contains($1) ? " " : ""

            return $0 + separator + String($1)
        }
        .split(separator: " ")
        .map(String.init)
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

    public mutating func replace(_ candidate: String, with replacement: String) {
        self.replace([candidate: replacement])
    }

    public func replacing(_ replacements: [String: String]) -> String {
        var result = self
        result.replace(replacements)

        return result
    }

    public func replacing(_ candidate: String, with replacement: String) -> String {
        replacing([candidate: replacement])
    }
}
