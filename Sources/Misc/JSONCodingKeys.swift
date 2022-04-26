struct JSONCodingKey: CodingKey {
    var intValue: Int?
    var stringValue: String

    init?(intValue: Int) {
        self.init(stringValue: "\(intValue)")
        self.intValue = intValue
    }

    init?(stringValue: String) {
        self.stringValue = stringValue
    }

}
