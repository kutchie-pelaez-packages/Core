import Foundation

public enum Application {
    public static var bundleId: String {
        safeUndefinedIfNil(
            Bundle.main.bundleIdentifier,
            "",
            "Failed to get bundle identifier"
        )
    }

    public static var name: String {
        safeUndefinedIfNil(
            infoPlist["CFBundleName"] as? String,
            "",
            "Failed to get application name"
        )
    }

    public static var version: Version {
        let stringVersion = safeUndefinedIfNil(
            infoPlist["CFBundleShortVersionString"] as? String,
            "",
            "Failed to get application version"
        )

        return safeUndefinedIfNil(
            Version(stringVersion),
            .zero,
            "Failed to get current version from Info.plist: \(stringVersion)"
        )
    }

    public static var build: String {
        safeUndefinedIfNil(
            infoPlist["CFBundleVersion"] as? String,
            "",
            "Failed to get application build"
        )
    }

    private static var infoPlist: [String: Any] {
        safeUndefinedIfNil(
            Bundle.main.infoDictionary,
            [:],
            "Failed to get info dictionaty from main bundle"
        )
    }
}
