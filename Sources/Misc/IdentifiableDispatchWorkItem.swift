import Foundation

public final class IdentifiableDispatchWorkItem: Equatable {
    public init(
        id: String = UUID().uuidString,
        block: @escaping Block
    ) {
        self.id = id
        self.dispatchWorkItem = DispatchWorkItem(block: block)
    }

    public let id: String
    public let dispatchWorkItem: DispatchWorkItem

    public func cancel() {
        dispatchWorkItem.cancel()
    }

    // MARK: - Equatable

    public static func == (lhs: IdentifiableDispatchWorkItem, rhs: IdentifiableDispatchWorkItem) -> Bool {
        lhs.id == rhs.id
    }
}
