import Foundation

public protocol IntProvider {
    var providee: Int { get }
}

public protocol StringProvider {
    var providee: String { get }
}

public protocol DoubleProvider {
    var providee: Double { get }
}

public protocol BoolProvider {
    var providee: Bool { get }
}

public protocol DataProvider {
    var providee: Data { get }
}
