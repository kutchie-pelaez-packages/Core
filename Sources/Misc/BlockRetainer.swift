import Foundation

public final class BlockRetainer {
    private let action: Action

    public init(
        attachTo object: NSObject,
        action: @escaping Action
    ) {
        self.action = action
        object.associateAnonymousReference(to: self)
    }

    @objc public func invoke() {
        action()
    }
}
