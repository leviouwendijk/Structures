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
