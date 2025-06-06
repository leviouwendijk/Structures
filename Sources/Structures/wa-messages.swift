import Foundation
import plate

public enum WAMessageTemplate: String, Hashable, CaseIterable {
    case called
    case calledVariationI
    case calledVariationII
    case losing
    case repeatedCalls
    case follow

    public var title: String {
        switch self {
            case .called:
                return "Called"

            case .calledVariationI:
                return "Called -- Variation I"

            case .calledVariationII:
                return "Called -- Variation II"

            case .losing:
                return "Losing"

            case .repeatedCalls:
                return "Repeated Calls"

            case .follow:
                return "Generic Follow-up"
        }
    }


    public var subtitle: String {
        switch self {
            case .called, .calledVariationI, .calledVariationII:
                return "Call attempt, \"do you need us?\"--check, prompt to call us"

            case .losing:
                return "Call attempt, \"do you need us?\"--check"

            case .repeatedCalls:
                return "Repeated call attempts, \"do you need us?\"--check"

            case .follow:
                return "\"do you need us?\"--check"
        }
    }

    public var message: String {
        switch self {
        case .called:
            return """
            Hey {client},

            Ik heb je gebeld, maar kon je niet bereiken. 

            Wil je weten of wij je kunnen helpen met het gedrag van {dog}? Bel mij dan even terug.
            
            Je kan me bereiken op dit nummer (+316 23 62 13 90).

            —Casper | Hondenmeesters
            """

        case .calledVariationI:
            return """
            Hey {client},

            Ik heb je gebeld, maar kon je niet bereiken. 

            Graag spreek ik je over {dog}. Bel mij even terug wanneer het jou uitkomt.

            Je kan me bereiken op dit nummer (+316 23 62 13 90).

            —Casper | Hondenmeesters
            """

        case .calledVariationII:
            return """
            Hey {client},

            Ik heb je gebeld, maar kon je niet bereiken. 

            Graag spreek ik je nog even over {dog}.

            Je kan me terugbellen op dit nummer (+316 23 62 13 90).

            —Casper | Hondenmeesters

            """


        case .losing:
            return """
            Hey {client},

            Ik heb je gebeld, maar kon je niet bereiken. 

            Heb je geen hulp meer nodig voor {dog}?

            —Casper | Hondenmeesters
            """

        case .repeatedCalls:
            return """
            Hey {client},

            Ik heb je enkele keren gebeld, maar kon je daarmee niet bereiken.

            Heb je geen hulp meer nodig met het gedrag van {dog}?

            —Casper | Hondenmeesters
            """

        case .follow:
            return """
            Hey {client},

            We hebben al even niet van je gehoord. 

            Heb je geen hulp meer nodig voor {dog}?

            —Casper | Hondenmeesters
            """
        }
    }
}
