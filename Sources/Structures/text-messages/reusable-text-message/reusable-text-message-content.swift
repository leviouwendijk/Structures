import Foundation

public struct ReusableTextMessageContent: Codable, Sendable {
    public var subject: String
    public var message: String
    
    public init(
        subject: String,
        message: String
    ) {
        self.subject = subject
        self.message = message
    }
}
