public struct WeakArray<T>: Collection, ExpressibleByArrayLiteral {
    public init() {
        self.buffer = []
    }

    private var buffer: [Resolver<T?>]

    private var values: [T] {
        buffer.compactMap { $0() }
    }

    public mutating func append(_ value: T) {
        let object = value as AnyObject
        buffer.append { [weak object] in object as? T }
    }

    // MARK: - Collection

    public var startIndex: Int {
        values.startIndex
    }

    public var endIndex: Int {
        values.endIndex
    }

    public subscript(index: Int) -> T {
        values[index]
    }

    public func index(after i: Int) -> Int {
        values.index(after: i)
    }

    // MARK: - ExpressibleByArrayLiteral

    public init(arrayLiteral elements: T...) {
        self.buffer = elements
            .map { element in
                let object = element as AnyObject

                return { [weak object] in
                    object as? T
                }
            }
    }
}
