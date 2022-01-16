@propertyWrapper
public struct Clamped<T: Comparable> {
    public init(
        wrappedValue: T,
        _ range: ClosedRange<T>
    ) {
        self.value = wrappedValue
        self.lowerBound = range.lowerBound
        self.upperBound = range.upperBound
    }

    public init(
        wrappedValue: T,
        _ range: PartialRangeFrom<T>
    ) {
        self.value = wrappedValue
        self.lowerBound = range.lowerBound
        self.upperBound = nil
    }

    public init(
        wrappedValue: T,
        _ range: PartialRangeThrough<T>
    ) {
        self.value = wrappedValue
        self.lowerBound = nil
        self.upperBound = range.upperBound
    }

    private var value: T
    private var clampedValue: T {
        if
            let lowerBound = lowerBound,
            let upperBound = upperBound
        {
            return min(max(lowerBound, value), upperBound)
        } else if let lowerBound = lowerBound {
            return max(lowerBound, value)
        } else if let upperBound = upperBound {
            return min(upperBound, value)
        } else {
            appFatalError()
        }
    }

    private let lowerBound: T?
    private let upperBound: T?

    public var wrappedValue: T {
        get {
            clampedValue
        } set {
            value = newValue
        }
    }
}