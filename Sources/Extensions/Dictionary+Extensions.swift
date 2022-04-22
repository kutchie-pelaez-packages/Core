import Foundation

extension Dictionary {
    public static func +(lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result = lhs
        rhs.forEach {
            result[$0] = $1
        }

        return result
    }

    public static func +=(lhs: inout [Key: Value], rhs: [Key: Value] ) {
        rhs.forEach { lhs[$0] = $1 }
    }

    public func unwrapped<V>() -> [Key: V] where Value == Optional<V> {
        compactMapValues { $0.isNil ? nil : $0.unsafelyUnwrapped }
    }
}
