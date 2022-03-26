extension Comparable {
    public func clamped(from: Self? = nil, to: Self? = nil) -> Self {
        if let from = from, let to = to {
            return max(min(self, to), from)
        } else if let from = from {
            return max(self, from)
        } else if let to = to {
            return min(self, to)
        } else {
            return self
        }
    }

    public mutating func clamp(from: Self? = nil, to: Self? = nil) {
        self = clamped(from: from, to: to)
    }

    public func clamped(_ range: ClosedRange<Self>) -> Self {
        clamped(from: range.lowerBound, to: range.upperBound)
    }

    public mutating func clamp(_ range: ClosedRange<Self>) {
        self = clamped(range)
    }

    public func clamped(_ range: PartialRangeFrom<Self>) -> Self {
        clamped(from: range.lowerBound)
    }

    public mutating func clamp(_ range: PartialRangeFrom<Self>) {
        self = clamped(range)
    }

    public func clamped(_ range: PartialRangeThrough<Self>) -> Self {
        clamped(to: range.upperBound)
    }

    public mutating func clamp(_ range: PartialRangeThrough<Self>) {
        self = clamped(range)
    }
}
