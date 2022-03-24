extension Sequence {
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

extension Sequence where Element: Sequence {
    public func flatten() -> [Element.Element] {
        flatMap { $0 }
    }
}
