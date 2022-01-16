import Foundation

private func isNil<T>(_ value: T) -> Bool {
    if case Optional<Any>.none = value as Any {
        return true
    } else {
        return false
    }
}

@propertyWrapper
struct UserDefault<T> {
    init(
        _ key: String,
        default: T
    ) {
        self.key = key
        self.defaultValue = `default`
    }

    private let key: String
    private let defaultValue: T

    var wrappedValue: T {
        get {
            (UserDefaults.standard.value(forKey: key) as? T) ?? defaultValue
        } set {
            if isNil(newValue) {
                UserDefaults.standard.removeObject(forKey: key)
            } else {
                UserDefaults.standard.set(newValue, forKey: key)
            }
        }
    }
}
