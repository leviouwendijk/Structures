import Foundation
import Combine
import SwiftUI
import plate

// service -- /follow, /onboarding
public struct MailerAPIServiceVariables: Encodable {
    public let name:       String
    public let dog:        String

    public init(name: String, dog: String) {
        self.name = name
        self.dog  = dog
    }
}
