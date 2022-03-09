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

    public func items(at url: URL) throws -> [URL] {
        try contentsOfDirectory(
            at: url,
            includingPropertiesForKeys: nil,
            options: .empty
        )
    }

    public func files(at url: URL) throws -> [URL] {
        try contentsOfDirectory(
            at: url,
            includingPropertiesForKeys: [.isRegularFileKey],
            options: .empty
        )
    }

    public func directories(at url: URL) throws -> [URL] {
        try contentsOfDirectory(
            at: url,
            includingPropertiesForKeys: [.isDirectoryKey],
            options: .empty
        )
    }

    public func fileExists(at url: URL) -> Bool {
        var isDirectory: ObjCBool = false

        return fileExists(atPath: url.path, isDirectory: &isDirectory)
    }

    public func directoryExists(at url: URL) -> Bool {
        var isDirectory: ObjCBool = true

        return fileExists(atPath: url.path, isDirectory: &isDirectory)
    }

    public func isDirectoryEmpty(at url: URL) -> Bool {
        (try? items(at: url))?.isEmpty == true
    }

    @discardableResult
    public func createFile(at url: URL, contents: Data?) -> Bool {
        createFile(
            atPath: url.path,
            contents: contents
        )
    }

    public func createDirectory(at url: URL) throws {
        try createDirectory(at: url, withIntermediateDirectories: true)
    }

    public func cleanup(_ directoryURL: URL) throws {
        for item in try items(at: directoryURL) {
            try removeItem(at: item)
        }
    }
}
