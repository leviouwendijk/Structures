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

    enum CodingKeys: String, CodingKey {
        case weekday, limit
    }

    public func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode(weekday, forKey: .weekday)
        if let l = limit {
            try c.encode(l, forKey: .limit)
        } else {
            try c.encodeNil(forKey: .limit)
        }
    }
}
