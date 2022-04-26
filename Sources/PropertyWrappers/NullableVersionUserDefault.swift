@propertyWrapper
public struct NullableVersionUserDefault {
    public var wrappedValue: Version? {
        get {
            guard let versionString = versionString else { return nil }

            return Version(versionString)
        }
        set { versionString = newValue?.description }
    }

    @UserDefault
    private var versionString: String?

    public init(_ key: String) {
        self._versionString = UserDefault(
            key,
            default: nil
        )
    }
}
