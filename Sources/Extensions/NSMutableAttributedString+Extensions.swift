import Foundation

extension NSMutableAttributedString {
    public func append(
        _ attribute: Any,
        for key: NSAttributedString.Key
    ) {
        addAttributes(
            [key: attribute],
            range: NSRange(
                location: 0,
                length: string.count
            )
        )
    }
}
