import os

private let logger = Logger("appFatalError")

public func appFatalError(
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> Never {
    let filename = file
        .split(separator: "/")
        .last
        .orEmpty
    logger.error("Fatal error in \(filename): \(function) on line \(line)\(message.isEmpty ? "" : ". Message: \(message)")")
    fatalError()
}
