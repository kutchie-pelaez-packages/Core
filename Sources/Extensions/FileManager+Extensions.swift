import Foundation

extension FileManager {
    public var documents: URL {
        undefinedIfNil(
            urls(
                for: .documentDirectory,
                in: .userDomainMask
            )[safe: 0],
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
        guard let items = try? items(at: url) else { return false }

        return items.isEmpty
    }

    @discardableResult
    public func createFile(at url: URL, contents: Data?) -> Bool {
        guard let contents = contents else { return false }

        return createFile(atPath: url.path, contents: contents)
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
