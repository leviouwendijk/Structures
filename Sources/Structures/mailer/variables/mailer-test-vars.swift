import Foundation

// /test/...
public struct MailerAPITestVariables: Codable, Sendable {
    public var message: String?
    public var statusCode: Int?
    public var extra: [String: String]?

    public init(
        message: String? = nil,
        statusCode: Int? = nil,
        extra: [String: String]? = nil
    ) {
        self.message = message
        self.statusCode = statusCode
        self.extra = extra
    }
}
