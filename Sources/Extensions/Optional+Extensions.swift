extension Optional {
    public var isNil: Bool {
        self == nil
    }

    public var isNotNil: Bool {
        self != nil
    }
}

extension Optional where Wrapped == String {
    public var orEmpty: Wrapped {
        self ?? ""
    }
}

extension Optional where Wrapped == Substring {
    public var orEmpty: String {
        String(self ?? "")
    }
}
