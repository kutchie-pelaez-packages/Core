import os

private let logger = Logger("undefined")

public func undefined<T>(
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
