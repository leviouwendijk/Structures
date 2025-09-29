import Foundation

public struct ReusableTextMessageStore: Codable, Sendable {
    public var messages: [ReusableTextMessageObject]
    
    public init(
        messages: [ReusableTextMessageObject] = []
    ) {
        self.messages = messages
    }

    public mutating func add(message: ReusableTextMessageObject) -> Void {
        messages.append(message)
    }

    public mutating func add(messages: [ReusableTextMessageObject]) -> Void {
        for m in messages {
            add(message: m)
        }
    }
}
