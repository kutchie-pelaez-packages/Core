extension CaseIterable {
    public init?(caseIndex: AllCases.Index) {
        if let value = Self.allCases[safe: caseIndex] {
            self = value
        } else {
            return nil
        }
    }

    public static var random: Self {
        undefinedIfNil(
            allCases.randomElement(),
            "\(Self.self) must has at least 1 case"
        )
    }
}

extension CaseIterable where Self: Equatable {
    public var caseIndex: AllCases.Index {
        undefinedIfNil(
            Self.allCases.firstIndex(where: { $0 == self }),
            "\(Self.self) must has at least 1 case"
        )
    }
}
