public protocol Reassignable {
    mutating func reassign()
}

extension Reassignable {
    public mutating func reassign() {
        let copy = self
        self = copy
    }
}

extension Bool: Reassignable { }

extension Int: Reassignable { }
