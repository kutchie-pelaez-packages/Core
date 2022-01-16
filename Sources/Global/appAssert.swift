import os

private let logger = Logger("appAssert")

public func appAssert(
    _ condition: Bool,
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) {
    guard !condition else { return }

    let filename = file
        .split(separator: "/")
        .last
        .orEmpty
    logger.error("Assert in \(filename): \(function) on line \(line)\(message.isEmpty ? "" : ". Message: \(message)")")
    assertionFailure()
}

public func appAssertionFailure(
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) {
    appAssert(
        false,
        message,
        file,
        function,
        line
    )
}
