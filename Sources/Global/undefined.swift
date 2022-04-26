public func undefined<T>(
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> T {
    fatalError()
}

public func undefinedIf<T>(
    _ condition: Bool,
    _ value: T,
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> T {
    guard condition else {
        return value
    }

    return undefined(message, file, function, line)
}

public func undefinedIfNil<T>(
    _ value: T?,
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> T {
    guard let value = value else {
        return undefined(message, file, function, line)
    }

    return value
}

public func safeUndefined<T>(
    _ fallback: T,
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> T {
    assertionFailure()

    return fallback
}

public func safeUndefinedIf<T>(
    _ condition: Bool,
    _ fallback: T,
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> T {
    guard condition else {
        return fallback
    }

    return safeUndefined(
        fallback,
        message,
        file,
        function,
        line
    )
}

public func safeUndefinedIfNil<T>(
    _ candidate: T?,
    _ fallback: T,
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> T {
    guard let candidate = candidate else {
        return safeUndefined(
            fallback,
            message,
            file,
            function,
            line
        )
    }

    return candidate
}
