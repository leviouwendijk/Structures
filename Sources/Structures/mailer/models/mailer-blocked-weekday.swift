import Foundation

public struct MailerAPIBlockedWeekday: Encodable {
    public let weekday: MailerAPIWeekday
    public let limit: Int?
    
    public init(
        weekday: MailerAPIWeekday,
        limit: Int? = nil
    ) {
        self.weekday = weekday
        self.limit = limit
    }
}
