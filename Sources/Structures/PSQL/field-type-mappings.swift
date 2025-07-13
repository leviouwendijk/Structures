import Foundation

public enum PSQLFieldTypeRegistryError: Error, LocalizedError {
    case noMapForSpecifiedTable(String)

    public var errorDescription: String? {
        switch self {
            case .noMapForSpecifiedTable(let tableQuery):
                return "No mapping was found in registry for provided table string query: \(tableQuery)"
        }
    }
}

public struct PSQLFieldTypeRegistry {
    private static let mapping: [String: [String: PSQLType]] = [
        "captcha_tokens": [
            "id":            .integer,
            "ip_address":    .text,
            "hashed_token":  .text,
            "expires_at":    .timestamptz,
            "usage_count":   .integer,
            "max_usages":    .integer,
            "invalidated":   .boolean,
            "created_at":    .timestamptz
        ],
    ]

    public static func table(named name: String) throws -> [String: PSQLType] {
        if let table = mapping[name] {
            return table
        } else {
            throw PSQLFieldTypeRegistryError.noMapForSpecifiedTable(name)
        }
    }
}
