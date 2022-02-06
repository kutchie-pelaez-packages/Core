@propertyWrapper
public struct VersionUserDefault {
    public init(
        _ key: String,
        _ defaultValue: Version
    ) {
        self._versionString = UserDefault(
            key,
            default: nil
        )
        self.defaultValue = defaultValue
    }

    @UserDefault
    private var versionString: String?
    private let defaultValue: Version

    public var wrappedValue: Version {
        get {
            guard let versionString = versionString else {
                return defaultValue
            }

            return Version(versionString) ?? defaultValue
        } set {
            versionString = newValue.description
        }
    }
}
