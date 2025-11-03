import Foundation
import plate

public struct FieldValue: Codable, Sendable, PreparableContent {
    public let value: JSONValue
    public let psqlType: PSQLType

    public init(value: JSONValue, psqlType: PSQLType) {
        self.value = value
        self.psqlType = psqlType
    }
}
