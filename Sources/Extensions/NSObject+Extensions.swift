import Foundation

extension NSObject {
    public func associateAnonymousReference(to object: AnyObject) {
        objc_setAssociatedObject(
            self,
            Unmanaged.passUnretained(object).toOpaque(),
            object,
            .OBJC_ASSOCIATION_RETAIN
        )
    }
}
