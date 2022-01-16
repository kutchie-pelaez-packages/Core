extension CaseIterable {
    public init?(caseIndex index: AllCases.Index) {
        if let value = Self.allCases[safe: index] {
            self = value
        } else {
            return nil
        }
    }

    public static var random: Self {
        undefinedIfNil(
            allCases.randomElement(),
            "There must be at least 1 element"
        )
    }
}

extension CaseIterable where Self: Equatable {
    public var caseIndex: AllCases.Index? {
        Self.allCases.firstIndex(where: { $0 == self })
    }
}
