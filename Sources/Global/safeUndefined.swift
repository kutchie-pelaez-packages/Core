import os

private let logger = Logger("safeUndefined")

public func safeUndefined<T>(
    _ fallback: T,
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> T {
    let filename = file
        .split(separator: "/")
        .last
        .orEmpty
    logger.error("Undefined value found in \(filename): \(function) on line \(line)\(message.isEmpty ? "" : ". Message: \(message)")")
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
