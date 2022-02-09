public func crash(
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) -> Never {
    let filename = file.split(separator: "/").last.orEmpty
    fatalError("Fatal error in \(filename): \(function) on line \(line)\(message.isEmpty ? "" : ". Message: \(message)")")
}
