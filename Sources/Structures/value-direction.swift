import Foundation

@available(*, deprecated, message: "Direction primitive is defined in leviouwendijk/Accounting.git, use it instead.")
public enum ValueDirectionError: Error, CustomStringConvertible, Sendable {
    case invalidCode(String)

    public var description: String {
        switch self {
        case .invalidCode(let raw):
            return "Invalid Direction code: '\(raw)'"
        }
    }
}

@available(*, deprecated, message: "Direction primitive is defined in leviouwendijk/Accounting.git, use it instead.")
public enum ValueDirection: String, Codable, Sendable {
    case debit
    case credit

    public init(raw: String) throws {
        let upper = raw.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        switch upper {
        case "D", "DR", Self.debit.rawValue.uppercased(), Self.debit.rawValue:
            self = .debit
        case "C", "CR", Self.credit.rawValue.uppercased(), Self.credit.rawValue:
            self = .credit
        default:
            throw ValueDirectionError.invalidCode(raw)
        }
    }

    public init(from decoder: Decoder) throws {
        let s = try decoder.singleValueContainer().decode(String.self)
        self = try ValueDirection(raw: s)
    }

    public func encode(to encoder: Encoder) throws {
        var c = encoder.singleValueContainer()
        try c.encode(self.rawValue)
    }
}

// ValueDirection
// ValueOrientation
// EntryOrientation
// EntryDirection
// AccountingDirection
// AccountingOrientation
