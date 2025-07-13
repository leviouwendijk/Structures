import Foundation

public struct FieldValue: Codable, Sendable {
    public let value: JSONValue
    public let psqlType: PSQLType

    public init(value: JSONValue, psqlType: PSQLType) {
        self.value = value
        self.psqlType = psqlType
    }
}
