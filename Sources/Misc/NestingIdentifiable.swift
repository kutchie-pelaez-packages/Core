public protocol NestingIdentifiable {
    var nestingIdentifier: String { get }
}

extension NestingIdentifiable {
    public var nestingIdentifier: String {
        String(reflecting: type(of: self))
    }
}

extension NestingIdentifiable where Self: RawRepresentable, RawValue == String {
    public var nestingIdentifier: String {
        let parts = [
            String(reflecting: type(of: self)),
            rawValue
        ]

        return parts.joined(separator: ".")
    }
}
