import Foundation

public struct ReusableTextMessageObject: Codable, Sendable {
    public let key: String
    public let object: ReusableTextMessage
    
    public init(
        key: String,
        object: ReusableTextMessage
    ) {
        self.key = key
        self.object = object
    }
}
