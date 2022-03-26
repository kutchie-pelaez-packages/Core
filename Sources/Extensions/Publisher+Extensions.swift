import Combine
import Foundation

extension Publisher {
    public func debounce(
        for interval: TimeInterval,
        queue: DispatchQueue = .main,
        options: DispatchQueue.SchedulerOptions? = nil
    ) -> Publishers.Debounce<Self, DispatchQueue> {
        debounce(
            for: DispatchQueue.SchedulerTimeType.Stride(floatLiteral: interval),
            scheduler: queue,
            options: options
        )
    }

    public func voided() -> AnyPublisher<Void, Failure> {
        map { _ in () }.eraseToAnyPublisher()
    }
}
