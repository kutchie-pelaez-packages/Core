import Combine

public class ValueSubject<Value>: Publisher {
    fileprivate init(_ value: Output) {
        self.currentValueSubject = CurrentValueSubject<Output, Failure>(value)
    }

    fileprivate let currentValueSubject: CurrentValueSubject<Output, Failure>

    public var value: Output {
        currentValueSubject.value
    }

    // MARK: - Publisher

    public typealias Output = Value

    public typealias Failure = Never

    public func receive<S>(subscriber: S) where S: Subscriber, S.Failure == Failure, S.Input == Output {
        currentValueSubject.receive(subscriber: subscriber)
    }
}

public final class MutableValueSubject<Value>: ValueSubject<Value> {
    public override init(_ value: Output) {
        super.init(value)
    }

    public override var value: Output {
        get { super.value }
        set { super.currentValueSubject.value = newValue }
    }
}
