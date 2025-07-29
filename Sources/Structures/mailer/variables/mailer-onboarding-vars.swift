import Foundation
import SwiftUI
import plate

// onboarding -- /assessment
public struct MailerAPIOnboardingVariables: Encodable {
    public let name:        String
    public let dog:         String
    public let email:       String
    
    public init(
        name: String,
        dog: String,
        email: String,
    ) {
        self.name = name
        self.dog = dog
        self.email = email
    }
}
