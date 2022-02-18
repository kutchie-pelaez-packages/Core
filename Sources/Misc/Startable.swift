public protocol Startable {
    func start()
}

public struct Awake: Startable {
    public init(_: Any?) { }

    public func start() { }
}
