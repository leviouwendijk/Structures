import Foundation

extension Int {
    public var grammar: LabelGrammar {
        return LabelGrammar.from(self)
    }
}

public enum LabelGrammar: Sendable {
    case singular
    case plural

    public static func from(_ count: Int) -> LabelGrammar {
        return count > 1 ? .plural : .singular
    }
}

public enum SessionLabel: String, Sendable {
    case session
    case sessions

    public init(count: Int) {
        let grammar = count.grammar
        self = SessionLabel.set(grammar: grammar)
    }

    public var dutch: String {
        switch self {
        case .session:
            return "sessie"
        case .sessions:
            return "sessies"
        }
    }

    public static func set(grammar: LabelGrammar) -> SessionLabel {
        switch grammar {
        case .singular:
            return .session
        case .plural:
            return .sessions
        }
    }
}
