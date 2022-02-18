public protocol Reassignable {
    mutating func reassign()
}

extension Reassignable {
    public mutating func reassign() {
        let copy = self
        self = copy
    }
}

extension Int: Reassignable { }

extension String: Reassignable { }

extension Double: Reassignable { }

extension Bool: Reassignable { }
