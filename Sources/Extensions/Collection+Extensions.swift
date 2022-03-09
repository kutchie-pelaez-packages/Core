extension Collection {
    public subscript(safe index: Index?) -> Element? {
        guard let index = index else { return nil }

        return indices.contains(index) ? self[index] : nil
    }

    public var isNotEmpty: Bool {
        !isEmpty
    }

    public func unwrapped<T>() -> [T] where Element == Optional<T> {
        compactMap { $0 }
    }

    public func asyncMap<T>(_ transform: (Element) async throws -> T) async rethrows -> [T] {
        var result = [T]()

        for element in self {
            try await result.append(transform(element))
        }

        return result
    }
}
