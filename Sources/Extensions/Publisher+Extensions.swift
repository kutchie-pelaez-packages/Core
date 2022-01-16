import Combine
import Foundation

extension Publisher {
    public func dispatch(on queue: DispatchQueue) -> Publishers.ReceiveOn<Self, DispatchQueue> {
        receive(on: queue)
    }

    public func debounce(
        for interval: TimeInterval,
        on queue: DispatchQueue = .main
    ) -> Publishers.Debounce<Self, DispatchQueue> {
        debounce(
            for: DispatchQueue.SchedulerTimeType.Stride(floatLiteral: interval),
            scheduler: queue
        )
    }

    public func asVoid() -> Publishers.Map<Self, Void> {
        map { _ in () }
    }

    public func eraseToVoidPublisher() -> AnyPublisher<Void, Failure> {
        asVoid().eraseToAnyPublisher()
    }
}
