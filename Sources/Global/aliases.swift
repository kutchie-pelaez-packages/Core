import Combine

public typealias Action = () -> Void
public typealias ActionWith<Arg> = (Arg) -> Void
public typealias Resolver<Resolvee> = () -> Resolvee

public typealias ValuePublisher<Value> = AnyPublisher<Value, Never>
public typealias VoidPublisher = AnyPublisher<Void, Never>

public typealias ValuePassthroughSubject<Value> = PassthroughSubject<Value, Never>
public typealias VoidPassthroughSubject = PassthroughSubject<Void, Never>
