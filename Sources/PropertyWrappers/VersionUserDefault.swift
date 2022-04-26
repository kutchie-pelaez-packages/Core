@propertyWrapper
public struct VersionUserDefault {
    public var wrappedValue: Version {
        get {
            guard let versionString = versionString else {
                return `default`
            }

            return Version(versionString) ?? `default`
        }
        set { versionString = newValue.description }
    }

    @UserDefault
    private var versionString: String?
    private let `default`: Version

    public init(
        _ key: String,
        _ default: Version
    ) {
        self._versionString = UserDefault(key, default: nil)
        self.default = `default`
    }
}
