import Foundation

private func isNil<T>(_ value: T) -> Bool {
    if case Optional<Any>.none = value as Any {
        return true
    } else {
        return false
    }
}

@propertyWrapper
public struct UserDefault<T> {
    public init(
        _ key: String,
        default: T
    ) {
        self.key = key
        self.default = `default`
    }

    private let key: String
    private let `default`: T

    public var wrappedValue: T {
        get {
            (UserDefaults.standard.value(forKey: key) as? T) ?? `default`
        } set {
            if isNil(newValue) {
                UserDefaults.standard.removeObject(forKey: key)
            } else {
                UserDefaults.standard.set(newValue, forKey: key)
            }
        }
    }
}
