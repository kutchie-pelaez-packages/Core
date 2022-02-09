public func crashIfDev(
    _ condition: Bool = true,
    _ message: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
) {
    guard !condition else { return }

    let filename = file.split(separator: "/").last.orEmpty
    assertionFailure("Assert in \(filename): \(function) on line \(line)\(message.isEmpty ? "" : ". Message: \(message)")")
}
