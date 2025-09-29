import Foundation

public struct ReusableTextMessage: Codable, Sendable {
    public let title: String
    public let details: String
    public let content: ReusableTextMessageContent
    
    public init(
        title: String,
        details: String,
        content: ReusableTextMessageContent
    ) {
        self.title = title
        self.details = details
        self.content = content
    }
}
