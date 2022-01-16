import Foundation

extension Dictionary {
    @inlinable
    public static func + (
        lhs: [Key: Value],
        rhs: [Key: Value]
    ) -> [Key: Value] {
        var result = lhs
        rhs.forEach {
            result[$0] = $1
        }

        return result
    }

    @inlinable
    public static func += (
        lhs: inout [Key: Value],
        rhs: [Key: Value]
    ) {
        rhs.forEach { lhs[$0] = $1 }
    }
    
    public var utf8Data: Data {
        safeUndefinedIfNil(
            try? JSONSerialization.data(
                withJSONObject: self,
                options: .empty
            ),
            Data(),
            "Failed to get utf8 data"
        )
    }

    public var utf8String: String {
        safeUndefinedIfNil(
            String(
                data: utf8Data,
                encoding: .utf8
            ),
            "",
            "Failed to get utf8 string"
        )
    }

    public func jsonObject<T: Decodable>(decoder: JSONDecoder = JSONDecoder()) -> T? {
        try? decoder.decode(
            T.self,
            from: utf8Data
        )
    }
}
