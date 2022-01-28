import Combine

public class ValueSubject<Value>: Publisher {
    internal init(_ value: Value) {
        currentValueSubject = CurrentValueSubject(value)
    }

    internal let currentValueSubject: CurrentValueSubject<Value, Failure>

    public var value: Value {
        currentValueSubject.value
    }

    // MARK: - Publisher

    public typealias Output = Value

    public typealias Failure = Never

    public func receive<S>(subscriber: S) where S : Subscriber, S.Failure == Never, S.Input == Value {
        currentValueSubject.receive(subscriber: subscriber)
    }
}
