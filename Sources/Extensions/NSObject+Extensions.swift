import Foundation

extension NSObject {
    public func associateAnonymousReference(to object: AnyObject) {
        let key = Unmanaged.passUnretained(object).toOpaque()
        objc_setAssociatedObject(
            self,
            key,
            object,
            .OBJC_ASSOCIATION_RETAIN
        )
    }
}
