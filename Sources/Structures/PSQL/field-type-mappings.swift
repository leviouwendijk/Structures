// import Foundation

// public enum PSQLFieldTypeRegistryError: Error, LocalizedError {
//     case noMapForSpecifiedTable(String)

//     public var errorDescription: String? {
//         switch self {
//             case .noMapForSpecifiedTable(let tableQuery):
//                 return "No mapping was found in registry for provided table string query: \(tableQuery)"
//         }
//     }
// }

// public struct PSQLFieldTypeRegistry {
//     private static let mapping: [String: [String: PSQLType]] = [
//         "captcha_tokens": [
//             "id":            .integer,
//             "ip_address":    .text,
//             "hashed_token":  .text,
//             "expires_at":    .timestamptz,
//             "usage_count":   .integer,
//             "max_usages":    .integer,
//             "invalidated":   .boolean,
//             "created_at":    .timestamptz
//         ],
//     ]

//     public static func table(named name: String) throws -> [String: PSQLType] {
//         if let table = mapping[name] {
//             return table
//         } else {
//             throw PSQLFieldTypeRegistryError.noMapForSpecifiedTable(name)
//         }
//     }
// }

import Foundation

public actor PSQLFieldTypeRegistry {
    public typealias Table = String
    public typealias Key   = String

    public static let shared = PSQLFieldTypeRegistry()

    // empty; populated by the Dataman binary at boot
    private var mapping: [Table: [Key: PSQLType]] = [:]

    // READ
    public func table(named name: String) throws -> [String: PSQLType] {
        if let m = mapping[name] { return m }
        throw Error.noMap(name)
    }

    // WRITE (idempotent by default)
    public func register(table name: String, types: [String: PSQLType], overwrite: Bool = false) {
        if overwrite || mapping[name] == nil { mapping[name] = types }
    }

    public func merge(table name: String, patch: [String: PSQLType]) {
        var base = mapping[name] ?? [:]
        for (k, v) in patch { base[k] = v }
        mapping[name] = base
    }

    public func snapshot() -> [Table: [Key: PSQLType]] { mapping }

    public enum Error: Swift.Error, LocalizedError {
        case noMap(String)
        public var errorDescription: String? {
            switch self {
            case .noMap(let t): return "No field-type map registered for table: \(t)"
            }
        }
    }
}
