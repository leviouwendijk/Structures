import Foundation
import Combine
import SwiftUI
import plate

// affiliate -- /food
public struct MailerAPIAffiliateVariables: Encodable {
    public let name:       String
    public let dog:        String

    public init(name: String, dog: String) {
        self.name = name
        self.dog  = dog
    }
}
