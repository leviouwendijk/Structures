import Foundation

extension Int {
    public var grammar: LabelGrammar {
        return LabelGrammar.from(self)
    }
}

public enum LabelGrammar: Codable, Sendable {
    case singular
    case plural

    public static func from(_ count: Int) -> LabelGrammar {
        return count > 1 ? .plural : .singular
    }
}
