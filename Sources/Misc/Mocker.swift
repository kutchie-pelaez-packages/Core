public protocol Mocker: EmptyInitable {
    associatedtype Mockee
    associatedtype Args

    func mock(with args: Args) -> Mockee
}

open class EmptyMocker<Mockee>: Mocker {
    public typealias Args = Void

    open func mock() -> Mockee {
        undefined("Override me")
    }

    // MARK: - EmptyInitable

    public required init() { }

    // MARK: - Mocker

    public func mock(with args: Void) -> Mockee {
        mock()
    }
}
