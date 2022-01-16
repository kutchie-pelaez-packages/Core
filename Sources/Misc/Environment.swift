public enum Environment: String {
    case dev
    case prod

    public var isDev: Bool {
        self == .dev
    }

    public var isProd: Bool {
        self == .prod
    }
}
