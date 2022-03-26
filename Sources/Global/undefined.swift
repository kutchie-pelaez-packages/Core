public func undefined<T>(
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> T {
    let filename = file.split(separator: "/").last.orEmpty
    fatalError("Undefined value found in \(filename): \(function) on line \(line)\(message.isEmpty ? "" : ". Message: \(message)")")
}

public func undefinedIf<T>(
    _ condition: Bool,
    _ value: T,
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> T {
    if condition {
        return undefined(
            message,
            file,
            function,
            line
        )
    } else {
        return value
    }
}

public func undefinedIfNil<T>(
    _ value: T?,
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> T {
    if let value = value {
        return value
    } else {
        return undefined(
            message,
            file,
            function,
            line
        )
    }
}

public func safeUndefined<T>(
    _ fallback: T,
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> T {
    let filename = file.split(separator: "/").last.orEmpty
    assertionFailure("Undefined value found in \(filename): \(function) on line \(line)\(message.isEmpty ? "" : ". Message: \(message)")")

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
    if condition {
        return safeUndefined(
            fallback,
            message,
            file,
            function,
            line
        )
    } else {
        return fallback
    }
}

public func safeUndefinedIfNil<T>(
    _ candidate: T?,
    _ fallback: T,
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> T {
    if let candidate = candidate {
        return candidate
    } else {
        return safeUndefined(
            fallback,
            message,
            file,
            function,
            line
        )
    }
}
