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

public typealias Map<Input, Output> = (Input) -> Output
public typealias Filter<T> = (T) -> Bool
