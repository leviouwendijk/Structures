import Foundation
import plate

public struct GeneralizedLabelGrammarSpecification: Codable, Sendable {
    public let language: LanguageSpecifier
    public let singular: String
    public let plural: String
    
    public init(
        language: LanguageSpecifier,
        singular: String,
        plural: String
    ) {
        self.language = language
        self.singular = singular
        self.plural = plural
    }
}

public struct GeneralizedLabelGrammar: Codable, Sendable {
    public let label: GeneralizedLabel
    public let grammar: GeneralizedLabelGrammarSpecification
    
    public init(
        label: GeneralizedLabel,
        grammar: GeneralizedLabelGrammarSpecification
    ) {
        self.label = label
        self.grammar = grammar
    }
}

public enum GeneralizedLabelError: Error, CustomStringConvertible {
    case missingLocalization(label: GeneralizedLabel, language: LanguageSpecifier)

    public var description: String {
        switch self {
        case let .missingLocalization(label, lang):
            return "No localization found for \(label.rawValue) in \(lang.rawValue)."
        }
    }
}

public enum GeneralizedLabel: String, RawRepresentable, Codable, CaseIterable, Sendable, StringParsableEnum {
    case session
    case appointment

    public static let map: [GeneralizedLabel: [LanguageSpecifier: [LabelGrammar: String]]] = [
        .session: [
            .dutch: [
                .singular: "sessie",
                .plural:   "sessies",
            ],
            .english: [ 
                .singular: "session",
                .plural: "sessions" 
            ]
        ],
        .appointment: [
            .dutch: [
                .singular: "afspraak",
                .plural:   "afspraken",
            ],
            .english: [ 
                .singular: "appointment",
                .plural: "appointments" 
            ]
        ],
    ]

    public func grammar(
        language: LanguageSpecifier = .dutch,
    ) throws -> GeneralizedLabelGrammar {
        guard let languageDict = Self.map[self] else {
            throw GeneralizedLabelError.missingLocalization(label: self, language: language)
        }
        guard let forms = languageDict[language] else {
            throw GeneralizedLabelError.missingLocalization(label: self, language: language)
        }
        guard let singularText = forms[.singular],
              let pluralText   = forms[.plural] else {
            throw GeneralizedLabelError.missingLocalization(label: self, language: language)
        }
        let spec = GeneralizedLabelGrammarSpecification(
            language: language,
            singular: singularText,
            plural:   pluralText
        )
        return GeneralizedLabelGrammar(label: self, grammar: spec)
    }

    public func value(
        language: LanguageSpecifier = .dutch,
        grammar: LabelGrammar
    ) throws -> String {
        guard let languageDict = Self.map[self] else {
            throw GeneralizedLabelError.missingLocalization(label: self, language: language)
        }
        guard let forms = languageDict[language] else {
            throw GeneralizedLabelError.missingLocalization(label: self, language: language)
        }
        guard let result = forms[grammar] else {
            throw GeneralizedLabelError.missingLocalization(label: self, language: language)
        }
        return result
    }

    public func value(
        language: LanguageSpecifier = .dutch,
        count: Int
    ) throws -> String {
        let grammar = count.grammar

        guard let languageDict = Self.map[self] else {
            throw GeneralizedLabelError.missingLocalization(label: self, language: language)
        }
        guard let forms = languageDict[language] else {
            throw GeneralizedLabelError.missingLocalization(label: self, language: language)
        }
        guard let result = forms[grammar] else {
            throw GeneralizedLabelError.missingLocalization(label: self, language: language)
        }
        return result
    }

    public var placeholder: String {
        return "generalized_\(rawValue)_label"
    }

    public func replacement(
        count: Int,
        language: LanguageSpecifier = .dutch,
        syntax: PlaceholderSyntax = PlaceholderSyntax(prepending: "{{", appending: "}}")
    ) throws -> StringTemplateReplacement {
        let text = try value(language: language, count: count)
        let fullPlaceholder = syntax.set(for: placeholder)
        return StringTemplateReplacement(
            placeholders:     [fullPlaceholder],
            replacement:      text,
            initializer:      .manual,
            placeholderSyntax: syntax
        )
    }
}
