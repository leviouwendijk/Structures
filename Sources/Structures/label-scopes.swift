import Foundation

public enum SessionLabel: String, RawRepresentable, Sendable {
    case session
    case sessions

    public init(count: Int) {
        let grammar = count.grammar
        self = Self.set(grammar: grammar)
    }

    public var english: String {
        return self.rawValue
    }

    public var dutch: String {
        switch self {
        case .session:
            return "sessie"
        case .sessions:
            return "sessies"
        }
    }

    public static func set(grammar: LabelGrammar) -> Self {
        switch grammar {
        case .singular:
            return .session
        case .plural:
            return .sessions
        }
    }

    public static func dutchLabel(count: Int) -> String {
        return SessionLabel(count: count).dutch
    }
}

public enum AppointmentLabel: String, RawRepresentable, Sendable {
    case appointment
    case appointments

    public init(count: Int) {
        let grammar = count.grammar
        self = Self.set(grammar: grammar)
    }

    public var english: String {
        return self.rawValue
    }

    public var dutch: String {
        switch self {
        case .appointment:
            return "afspraak"
        case .appointments:
            return "afspraken"
        }
    }

    public static func set(grammar: LabelGrammar) -> Self {
        switch grammar {
        case .singular:
            return .appointment
        case .plural:
            return .appointments
        }
    }

    public static func dutchLabel(count: Int) -> String {
        return SessionLabel(count: count).dutch
    }
}
