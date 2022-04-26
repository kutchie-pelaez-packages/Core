import Foundation

@discardableResult
public func dispatch(
    to queue: DispatchQueue,
    after delay: TimeInterval,
    action: @escaping Action
) -> IdentifiableDispatchWorkItem {
    let identifiableDispatchWorkItem = IdentifiableDispatchWorkItem(action: action)
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
    action: @escaping Action
) -> IdentifiableDispatchWorkItem {
    dispatch(
        to: .main,
        after: delay,
        action: action
    )
}

@discardableResult
public func dispatch(action: @escaping Action) -> IdentifiableDispatchWorkItem {
    dispatch(
        after: .zero,
        action: action
    )
}
