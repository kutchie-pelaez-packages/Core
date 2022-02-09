public func crash(
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> Never {
    let filename = file.split(separator: "/").last.orEmpty
    fatalError("Crash in \(filename): \(function) on line \(line)\(message.isEmpty ? "" : ". Message: \(message)")")
}

public func crashIf(
    _ condition: Bool,
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) {
    guard condition else { return }

    crash(
        message,
        file,
        function,
        line
    )
}
