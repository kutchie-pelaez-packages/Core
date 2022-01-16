import Foundation

public enum ApplicationInfo {
    public static var bundleId: String {
        safeUndefinedIfNil(
            Bundle.main.bundleIdentifier,
            "",
            "Failed to get bundle identifier"
        )
    }

    public static var name: String {
        safeUndefinedIfNil(
            mainBundleInfoPlist["CFBundleName"] as? String,
            "",
            "Failed to get application name"
        )
    }

    static var version: String {
        safeUndefinedIfNil(
            mainBundleInfoPlist["CFBundleShortVersionString"] as? String,
            "",
            "Failed to get application version"
        )
    }

    public static var build: String {
        safeUndefinedIfNil(
            mainBundleInfoPlist["CFBundleVersion"] as? String,
            "",
            "Failed to get application build"
        )
    }

    private static var mainBundleInfoPlist: [String: Any] {
        safeUndefinedIfNil(
            Bundle.main.infoDictionary,
            [:],
            "Failed to get info dictionaty from main bundle"
        )
    }
}
