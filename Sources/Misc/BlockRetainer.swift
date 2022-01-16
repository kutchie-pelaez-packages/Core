import Foundation

public final class BlockRetainer {
    public init(
        attachTo object: NSObject,
        block: @escaping Block
    ) {
        self.block = block
        object.associateAnonymousReference(to: self)
    }

    private let block: Block

    @objc public func invoke() {
        block()
    }
}
