import Foundation

// public struct FieldValue: Codable, Sendable {
//     public let value: JSONValue
//     public let psqlType: PSQLType

//     public init(value: JSONValue, psqlType: PSQLType) {
//         self.value = value
//         self.psqlType = psqlType
//     }
// }

import Foundation


/// Generic field wrapper: a JSONValue plus an external type tag `T`.
/// - use `T` to bind it to, say, PSQLType
// @available(*, message: "Decoupled from JSONValue (requires new type passage), and moved to plate")
// public struct FieldValue<T: Sendable & Codable>: Codable, Sendable {
//     public let value: JSONValue
//     public let type: T

//     @inlinable
//     public init(
//         value: JSONValue,
//         type: T
//     ) {
//         self.value = value
//         self.type = type
//     }
// }

// extension FieldValue: Codable where T: Codable { }
// extension FieldValue: Equatable where T: Equatable { }
// extension FieldValue: Hashable where T: Hashable { }
