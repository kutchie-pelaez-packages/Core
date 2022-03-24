import Combine

public class MutableValueSubject<Value>: ValueSubject<Value> {
    public override init(_ currentValueSubject: CurrentValueSubject<Output, Failure>) {
        super.init(currentValueSubject)
    }

    public override init(_ value: Value) {
        super.init(value)
    }

    public override var value: Value {
        get { super.value }
        set { super.currentValueSubject.value = newValue }
    }
}

public final class UniqueMutableValueSubject<Value>: MutableValueSubject<Value> where Value: Equatable {
    public init(
        _ currentValueSubject: CurrentValueSubject<Output, Failure>,
        removeDuplicates: Bool = true
    ) {
        self.removeDuplicates = removeDuplicates
        super.init(currentValueSubject)
    }

    public init(
        _ value: Value,
        removeDuplicates: Bool = true
    ) {
        self.removeDuplicates = removeDuplicates
        super.init(value)
    }

    private let removeDuplicates: Bool

    public override var value: Value {
        get { super.value }
        set {
            guard
                newValue != value ||
                !removeDuplicates
            else {
                return
            }

            super.value = newValue
        }
    }
}
