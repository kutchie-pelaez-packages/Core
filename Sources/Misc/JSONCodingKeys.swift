struct JSONCodingKey: CodingKey {

    // MARK: - CodingKey

    init?(intValue: Int) {
        self.init(stringValue: "\(intValue)")
        self.intValue = intValue
    }

    init?(stringValue: String) {
        self.stringValue = stringValue
    }

    var stringValue: String

    var intValue: Int?
}
