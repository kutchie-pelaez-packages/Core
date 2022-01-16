public struct Version:
    CustomStringConvertible,
    Comparable,
    Codable
{

    public init(
        major: Int,
        minor: Int,
        patch: Int
    ) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }

    public init?(_ string: String) {
        let parts = string
            .split(separator: ".")
            .map(String.init)
            .compactMap(Int.init)

        guard 1...3 ~= parts.count else { return nil }

        major = parts[safe: 0] ?? 0
        minor = parts[safe: 1] ?? 0
        patch = parts[safe: 2] ?? 0
    }

    public static var current: Version {
        safeUndefinedIfNil(
            Version(ApplicationInfo.version),
            zero,
            "Failed to get current version from Info.plist: \(ApplicationInfo.version)"
        )
    }

    private static var zero: Version {
        Version(
            major: 0,
            minor: 0,
            patch: 0
        )
    }

    public let major: Int
    public let minor: Int
    public let patch: Int


    // MARK: - CustomStringConvertible

    public var description: String {
        "\(major).\(minor).\(patch)"
    }

    // MARK: - Equtable

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.major == rhs.major &&
        lhs.minor == rhs.minor &&
        lhs.patch == rhs.patch
    }

    // MARK: - Comparable

    public static func < (lhs: Self, rhs: Self) -> Bool {
        if lhs.major != rhs.major {
            return lhs.major < rhs.major
        } else if lhs.minor != rhs.minor {
            return lhs.minor < rhs.minor
        } else {
            return lhs.patch < rhs.patch
        }
    }

    // MARK: - Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let verionString = try container.decode(String.self)

        if let version = Version(verionString) {
            self = version
        } else {
            throw VersionDecodingError.invalidVersionFormat
        }
    }

    // MARK: - Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let verionString = description

        try container.encode(verionString)
    }
}

public enum VersionDecodingError: Error {
    case invalidVersionFormat
}
