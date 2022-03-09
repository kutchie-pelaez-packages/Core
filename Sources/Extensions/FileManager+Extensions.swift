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

    public func cleanup(_ url: URL) throws {
        for item in try contentsOfDirectory(
            at: url,
            includingPropertiesForKeys: nil
        ) {
            try removeItem(at: item)
        }
    }
}
