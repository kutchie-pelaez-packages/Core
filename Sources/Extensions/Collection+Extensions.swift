extension Collection {
    public var isNotEmpty: Bool { !isEmpty }

    public subscript(safe index: Index?) -> Element? {
        guard let index = index else { return nil }

        return indices.contains(index) ? self[index] : nil
    }
}
