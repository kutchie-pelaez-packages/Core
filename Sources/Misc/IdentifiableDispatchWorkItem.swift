import Foundation

public final class IdentifiableDispatchWorkItem: Equatable {
    public let id: String
    public let dispatchWorkItem: DispatchWorkItem

    public init(
        id: String = UUID().uuidString,
        action: @escaping Action
    ) {
        self.id = id
        self.dispatchWorkItem = DispatchWorkItem(block: action)
    }

    public func cancel() {
        dispatchWorkItem.cancel()
    }

    // MARK: - Equatable

    public static func == (lhs: IdentifiableDispatchWorkItem, rhs: IdentifiableDispatchWorkItem) -> Bool {
        lhs.id == rhs.id
    }
}
