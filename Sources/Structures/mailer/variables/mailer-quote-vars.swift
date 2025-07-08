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

public struct MailerAPIQuoteAgreementComponentVariables: Encodable {
    public let deliverable: String
    public let detail: String
    public let price: String
    
    public init(
        deliverable: String,
        detail: String,
        price: String
    ) {
        self.deliverable = deliverable
        self.detail = detail
        self.price = price
    }
}
