public protocol Startable {
    func start()
}

public protocol StartableProvider {
    var startable: Startable { get }
}

extension StartableProvider {
    public func start() {
        startable.start()
    }
}

public struct Startables: Startable {
    public init(from startables: [Startable]) {
        self.startables = startables
    }

    public init(from startables: Startable...) {
        self.init(from: startables)
    }

    private let startables: [Startable]

    // MARK: - Startable

    public func start() {
        startables.forEach { $0.start() }
    }
}

public struct Touch: Startable {
    public init(_: Any?) { }

    // MARK: - Startable

    public func start() { }
}
