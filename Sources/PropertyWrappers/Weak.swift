import UIKit

@propertyWrapper
public struct Weak<T> {
    public init(wrappedValue: T?) {
        let object = wrappedValue as AnyObject
        resolver = { [weak object] in object as? T }
    }

    private var resolver: Resolver<T?>

    public var wrappedValue: T? {
        get {
            resolver()
        } set {
            let object = newValue as AnyObject
            resolver = { [weak object] in object as? T }
        }
    }
}
