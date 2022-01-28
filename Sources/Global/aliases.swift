import Combine

public typealias Block = () -> Void
public typealias IntBlock = (Int) -> Void
public typealias StringBlock = (String) -> Void
public typealias DoubleBlock = (Double) -> Void
public typealias BoolBlock = (Bool) -> Void
public typealias AsyncBlock = () async -> Void

public typealias Resolver<T> = () -> T
public typealias IntResolver = () -> Int
public typealias StringResolver = () -> String
public typealias DoubleResolver = () -> Double
public typealias BoolResolver = () -> Bool

public typealias ValuePublisher<Value> = AnyPublisher<Value, Never>
public typealias VoidPublisher = AnyPublisher<Void, Never>

public typealias ValueSubject<Value> = CurrentValueSubject<Value, Never>

public typealias ValueFuture<Value> = Future<Value, Never>
public typealias VoidFuture = Future<Void, Never>
