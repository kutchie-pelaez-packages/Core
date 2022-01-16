import Foundation

extension TimeInterval {
    public static let millisecond: TimeInterval = 0.001
    public static func milliseconds(_ amount: TimeInterval) -> TimeInterval {
        .millisecond * amount
    }

    public static let second: TimeInterval = .millisecond * 1000
    public static func seconds(_ amount: TimeInterval) -> TimeInterval {
        .second * amount
    }

    public static let minute: TimeInterval = .second * 60
    public static func minutes(_ amount: TimeInterval) -> TimeInterval {
        .minute * amount
    }

    public static let hour: TimeInterval = .minute * 60
    public static func hours(_ amount: TimeInterval) -> TimeInterval {
        .hour * amount
    }

    public static let day: TimeInterval = .hour * 24
    public static func days(_ amount: TimeInterval) -> TimeInterval {
        .day * amount
    }

    public static let week: TimeInterval = .day * 7
    public static func weeks(_ amount: TimeInterval) -> TimeInterval {
        .week * amount
    }
}
