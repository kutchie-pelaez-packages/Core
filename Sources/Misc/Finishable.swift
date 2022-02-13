public protocol Finishable {
    func finish()
}

public protocol FinishableProvider: Finishable {
    var finishable: Finishable { get }
}

extension Finishable where Self: FinishableProvider {
    public func finish() {
        finishable.finish()
    }
}

public struct Finishables: Finishable {
    public init(from finishables: [Finishable]) {
        self.finishables = finishables
    }

    public init(from finishables: Finishable...) {
        self.init(from: finishables)
    }

    private let finishables: [Finishable]

    // MARK: - Finishable

    public func finish() {
        finishables.forEach { $0.finish() }
    }
}
