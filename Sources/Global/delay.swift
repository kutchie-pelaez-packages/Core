import Foundation

public func delay(_ duration: TimeInterval) async {
    await withCheckedContinuation { continuation in
        dispatch(after: duration) {
            continuation.resume()
        }
    }
}
