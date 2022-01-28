import Combine

public class ValueSubject<Value>: Publisher {
    internal init(_ currentValueSubject: CurrentValueSubject<Output, Failure>) {
        self.currentValueSubject = currentValueSubject
    }

    internal init(_ value: Output) {
        self.currentValueSubject = CurrentValueSubject<Output, Failure>(value)
    }

    internal let currentValueSubject: CurrentValueSubject<Output, Failure>

    public var value: Output {
        currentValueSubject.value
    }

    // MARK: - Publisher

    public typealias Output = Value

    public typealias Failure = Never

    public func receive<S>(subscriber: S) where S : Subscriber, S.Failure == Failure, S.Input == Output {
        currentValueSubject.receive(subscriber: subscriber)
    }
}
