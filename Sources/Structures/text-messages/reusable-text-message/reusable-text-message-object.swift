import Foundation

public struct ReusableTextMessageObject: Codable, Sendable {
    public var key: String
    public var object: ReusableTextMessage
    
    public init(
        key: String,
        object: ReusableTextMessage
    ) {
        self.key = key
        self.object = object
    }
}
