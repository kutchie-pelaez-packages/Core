import Foundation

extension NSMutableAttributedString {
    public func append(_ attribute: Any, for key: NSAttributedString.Key) {
        let range = NSRange(location: 0, length: string.count)
        addAttributes([key: attribute], range: range)
    }
}
