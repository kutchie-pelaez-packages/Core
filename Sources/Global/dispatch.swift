import Foundation

@discardableResult
public func dispatch(
    to queue: DispatchQueue,
    after delay: TimeInterval,
    block: @escaping Block
) -> IdentifiableDispatchWorkItem {
    let identifiableDispatchWorkItem = IdentifiableDispatchWorkItem(block: block)
    let dispatchTimeInterval = DispatchTimeInterval.nanoseconds(
        Int(TimeInterval(NSEC_PER_SEC) * delay)
    )

    queue.asyncAfter(
        deadline: .now() + dispatchTimeInterval,
        execute: identifiableDispatchWorkItem.dispatchWorkItem
    )

    return identifiableDispatchWorkItem
}

@discardableResult
public func dispatch(
    after delay: TimeInterval,
    block: @escaping Block
) -> IdentifiableDispatchWorkItem {
    dispatch(
        to: .main,
        after: delay,
        block: block
    )
}

@discardableResult
public func dispatch(block: @escaping Block) -> IdentifiableDispatchWorkItem {
    dispatch(
        after: .zero,
        block: block
    )
}
