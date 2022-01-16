import Foundation

extension FileManager {
    public var documents: URL {
        let urls = urls(
            for: .documentDirectory,
            in: .userDomainMask
        )
        let candidate = urls[safe: 0]

        return safeUndefinedIfNil(
            candidate,
            URL(fileURLWithPath: ""),
            "Failed to get documents directory"
        )
    }
}
