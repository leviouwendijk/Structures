import Foundation
import Combine
import SwiftUI
import plate

// quote -- /issue, /follow
public struct MailerAPIQuoteVariables: Encodable {
    public let name:       String
    public let dog:        String

    public init(name: String, dog: String) {
        self.name = name
        self.dog  = dog
    }
}

// quote -- /agreement
public struct MailerAPIQuoteAgreementVariables: Encodable {
    public let name:        String
    public let dog:         String
    public let email:       String
    public let deliverable: AgreementDeliverable
    public let includeQuote: Bool
    
    public init(
        name: String,
        dog: String,
        email: String,
        deliverable: AgreementDeliverable,
        includeQuote: Bool = false
    ) {
        self.name = name
        self.dog = dog
        self.email = email
        self.deliverable = deliverable
        self.includeQuote = includeQuote
    }
}
