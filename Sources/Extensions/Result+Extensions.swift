extension Result {
    public var success: Success? {
        if case let .success(success) = self {
            return success
        }

        return nil
    }

    public var failure: Failure? {
        if case let .failure(error) = self {
            return error
        }

        return nil
    }
}
