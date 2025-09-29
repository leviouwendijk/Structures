import Foundation

public struct ReusableTextMessageContent: Codable, Sendable {
    public let subject: String
    public let message: String
    
    public init(
        subject: String,
        message: String
    ) {
        self.subject = subject
        self.message = message
    }
}
