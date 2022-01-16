import os

extension Logger {
    public init(_ category: String) {
        self.init(
            subsystem: ApplicationInfo.bundleId,
            category: category
        )
    }
}
