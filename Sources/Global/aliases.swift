import Combine

public typealias Block = () -> Void
public typealias IntBlock = (Int) -> Void
public typealias StringBlock = (String) -> Void
public typealias DoubleBlock = (Double) -> Void
public typealias BoolBlock = (Bool) -> Void

public typealias Resolver<T> = () -> T
public typealias IntResolver = () -> Int
public typealias StringResolver = () -> String
public typealias DoubleResolver = () -> Double
public typealias BoolResolver = () -> Bool

public typealias Mapper<From, To> = (From) -> To

public typealias ValuePublisher<Value> = AnyPublisher<Value, Never>
public typealias VoidPublisher = AnyPublisher<Void, Never>

public typealias ValuePassthroughSubject<Value> = PassthroughSubject<Value, Never>
public typealias VoidPassthroughSubject = PassthroughSubject<Void, Never>

public typealias ValueFuture<Value> = Future<Value, Never>
public typealias VoidFuture = Future<Void, Never>
