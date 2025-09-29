import Foundation

public struct ReusableTextMessageStore: Codable, Sendable {
    public let messages: [ReusableTextMessageObject]
    
    public init(
        messages: [ReusableTextMessageObject]
    ) {
        self.messages = messages
    }
}
