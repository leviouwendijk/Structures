import Foundation
import plate

public enum WAMessageTemplate: String, Hashable, CaseIterable {
    // case called
    case calledVariationI
    // case calledVariationII
    case losing
    case repeatedCalls
    case repeatedCallsVariationI
    case follow
    case contract

    public var title: String {
        switch self {
            // case .called:
            //     return "Called"

            case .calledVariationI:
                return "Called -- Variation I"

            // case .calledVariationII:
            //     return "Called -- Variation II"

            case .losing:
                return "Losing"

            case .repeatedCalls:
                return "Repeated Calls"

            case .repeatedCallsVariationI:
                return "Repeated Calls - Variation I"

            case .follow:
                return "Generic Follow-up"
            case .contract:
                return "Contractual agreement"
        }
    }


    public var subtitle: String {
        switch self {
            // case .called, .calledVariationI, .calledVariationII:
            //     return "Call attempt, \"do you need us?\"--check, prompt to call us"

            case .calledVariationI:
                return "Call attempt, \"do you need us?\"--check, prompt to call us"

            case .losing:
                return "Call attempt, \"do you need us?\"--check"

            case .repeatedCalls, .repeatedCallsVariationI:
                return "Repeated call attempts, \"do you need us?\"--check"

            case .follow:
                return "\"do you need us?\"--check"

            case .contract:
                return "\"confirm agreement to chosen service\""
        }
    }

    public var message: String {
        switch self {
        // case .called:
        //     return """
        //     Hey {client},

        //     Ik heb je gebeld, maar kon je niet bereiken. 

        //     Wil je weten of wij je kunnen helpen met het gedrag van {dog}? Bel mij dan even terug.
            
        //     Je kan me bereiken op dit nummer (+316 23 62 13 90).

        //     —Casper | Hondenmeesters
        //     """

        case .calledVariationI:
            return """
            Hey {client},

            Ik heb je gebeld, maar kon je niet bereiken. 

            Graag spreek ik je over {dog}. Bel mij even terug wanneer het jou uitkomt.

            Je kan me bereiken op dit nummer (+316 23 62 13 90).

            —Casper | Hondenmeesters
            """

        // case .calledVariationII:
        //     return """
        //     Hey {client},

        //     Ik heb je gebeld, maar kon je niet bereiken. 

        //     Graag spreek ik je nog even over {dog}.

        //     Je kan me terugbellen op dit nummer (+316 23 62 13 90).

        //     —Casper | Hondenmeesters

        //     """

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

        case .repeatedCallsVariationI:
            return """
            Hey {client},

            Ik heb je enkele keren gebeld, maar kon je daarmee niet bereiken.

            Als je onze hulp nog nodig hebt, laat het ons dan even weten.

            —Casper | Hondenmeesters
            """

        case .follow:
            return """
            Hey {client},

            We hebben al even niet van je gehoord. 

            Heb je geen hulp meer nodig voor {dog}?

            —Casper | Hondenmeesters
            """

        case .contract:
            return """
            Beste {client},

            Graag ontvangen wij je schriftelijke bevestiging van het volgende ("ik ga akkoord" volstaat):

            Afname van het volgende aanbod:

                Dienst: {deliverable}
                Details: {detail}
                Prijs (incl. btw): € {price}

            Conform onze algemene voorwaarden (https://hondenmeesters.nl/algemene-voorwaarden.html) en privacy beleid (https://hondenmeesters.nl/privacy-beleid.html).

            Indien akkoord zullen wij de afspraken in onze agenda definitief maken en bevestigen, zowel als het bedrag factureren.

            Mocht je vragen of aanmerkingen hebben, leg deze dan gerust aan ons voor.

            Hartelijke groet,
            Het Hondenmeesters Team
            """
        }
    }
}
