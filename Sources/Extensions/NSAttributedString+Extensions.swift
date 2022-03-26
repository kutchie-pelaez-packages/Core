import Foundation

extension NSAttributedString {
    public var mutable: NSMutableAttributedString {
        NSMutableAttributedString(attributedString: self)
    }

    public func attribute(for key: NSAttributedString.Key) -> Any? {
        attribute(key, at: 0, effectiveRange: nil)
    }

    public func appending(_ attribute: Any, for key: NSAttributedString.Key) -> NSAttributedString {
        let result = mutable
        result.append(attribute, for: key)

        return result
    }

    public func appending(_ string: String, attributes: [Key: Any] = [:]) -> NSAttributedString {
        let result = mutable
        let attributedString = NSAttributedString(string: string, attributes: attributes)
        result.append(attributedString)

        return result
    }
}
