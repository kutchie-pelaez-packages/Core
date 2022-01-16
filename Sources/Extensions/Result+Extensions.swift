extension Result {
    public var success: Success? {
        try? get()
    }

    public var failure: Failure? {
        if case let .failure(error) = self {
            return error
        }

        return nil
    }
}
