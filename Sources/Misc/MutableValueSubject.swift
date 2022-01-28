public final class MutableValueSubject<Value>: ValueSubject<Value> {
    public override init(_ value: Value) {
        super.init(value)
    }

    public override var value: Value {
        get {
            super.value
        } set {
            super.currentValueSubject.value = newValue
        }
    }
}
