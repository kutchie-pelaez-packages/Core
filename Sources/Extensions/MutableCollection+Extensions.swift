extension MutableCollection {
    public subscript(safe index: Index?) -> Element? {
        get {
            guard let index = index else { return nil }

            return indices.contains(index) ? self[index] : nil
        }
        set {
            guard
                let index = index,
                indices.contains(index),
                let newValue = newValue
            else {
                return
            }

            self[index] = newValue
        }
    }
}
