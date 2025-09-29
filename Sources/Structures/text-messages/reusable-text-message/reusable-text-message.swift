import Foundation

public struct ReusableTextMessage: Codable, Sendable {
    public var title: String
    public var details: String
    public var content: ReusableTextMessageContent
    
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
