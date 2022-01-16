extension Comparable {
    public func clamped(
        from: Self? = nil,
        to: Self? = nil
    ) -> Self {
        if
            let from = from,
            let to = to
        {
            return  max(min(self, to), from)
        } else if let from = from {
            return max(self, from)
        } else if let to = to {
            return min(self, to)
        } else {
            return self
        }
    }

    public func clamped(_ range: ClosedRange<Self>) -> Self {
        clamped(
            from: range.lowerBound,
            to: range.upperBound
        )
    }

    public func clamped(_ range: PartialRangeFrom<Self>) -> Self {
        clamped(
            from: range.lowerBound,
            to: nil
        )
    }

    public func clamped(_ range: PartialRangeThrough<Self>) -> Self {
        clamped(
            from: nil,
            to: range.upperBound
        )
    }
}
