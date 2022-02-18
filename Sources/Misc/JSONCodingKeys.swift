struct JSONCodingKey: CodingKey {
    init?(intValue: Int) {
        self.init(stringValue: "\(intValue)")
        self.intValue = intValue
    }

    var intValue: Int?

    init?(stringValue: String) {
        self.stringValue = stringValue
    }

    var stringValue: String
}
