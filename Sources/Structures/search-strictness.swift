import Foundation

// for fuzzy
public enum SearchStrictness: Int, CaseIterable, Identifiable, Sendable {
    case exact = 0
    case strict = 2
    case loose  = 3

    public var id: Self { self }
    public var title: String {
        switch self {
        case .exact:  return "Exact"
        case .strict: return "Strict"
        case .loose:  return "Loose"
        }
    }

    public var tolerance: Int { rawValue }
}
