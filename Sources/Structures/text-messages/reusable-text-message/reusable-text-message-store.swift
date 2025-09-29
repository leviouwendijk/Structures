import Foundation
import Combine

// public struct ReusableTextMessageStore: Codable, Sendable {
//     public var messages: [ReusableTextMessageObject]
    
//     public init(
//         messages: [ReusableTextMessageObject] = []
//     ) {
//         self.messages = messages
//     }

//     public mutating func add(message: ReusableTextMessageObject) -> Void {
//         messages.append(message)
//     }

//     public mutating func add(messages: [ReusableTextMessageObject]) -> Void {
//         for m in messages {
//             add(message: m)
//         }
//     }
// }

@MainActor
public class ReusableTextMessageStore: ObservableObject {
    // @Published public var messages: [ReusableTextMessageObject]

    public var messagesByKey: [String: ReusableTextMessage] = [:]
    
    // public init(
    //     messages: [ReusableTextMessageObject] = []
    // ) {
    //     self.messages = messages
    // }
    public init() {}

    public func add(message: ReusableTextMessageObject) -> Void {
        // self.messages.append(message)
        self.messagesByKey[message.key] = message.object
    }

    public func add(messages: [ReusableTextMessageObject]) -> Void {
        // for m in messages {
        //     add(message: m)
        // }
        // self.messages.append(contentsOf: messages)
        self.messagesByKey.merge(
            messages.map { ($0.key, $0.object) },
            uniquingKeysWith: { _, new in new }
        )
    }

    public func message(forKey key: String) -> ReusableTextMessage? {
        return messagesByKey[key]
    }
}
