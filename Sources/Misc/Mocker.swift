public protocol Mocker: EmptyInitable {
    associatedtype Mockee
    associatedtype Args

    func mock(with args: Args) -> Mockee
}
