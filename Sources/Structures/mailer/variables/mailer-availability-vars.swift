import Foundation
import Combine
import SwiftUI
import plate

// output full time_range dictionary
public struct MailerAPIAvailabilityContent: Encodable {
    public let schedule: [MailerAPIWeekday: MailerAPIDayAvailabilityContent]

    public init(from schedules: [MailerAPIWeekday: MailerAPIDaySchedule]) {
        var map: [MailerAPIWeekday: MailerAPIDayAvailabilityContent] = [:]
        let df: DateFormatter = {
            let f = DateFormatter()
            f.dateFormat = "HH:mm"
            return f
        }()
        for (day, sched) in schedules {
            guard sched.enabled else { continue }
            map[day] = .init(
                start: df.string(from: sched.start),
                end:   df.string(from: sched.end)
            )
        }
        self.schedule = map
    }

    public func time_range() -> [String: [String: String]] {
        schedule.reduce(into: [:]) { out, pair in
            let (day, avail) = pair
            out[day.rawValue] = [
                "start": avail.start,
                "end":   avail.end
            ]
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(time_range())
    }
}

// time range slot
public struct MailerAPIDayAvailabilityContent: Codable {
    public let start: String
    public let end:   String

    public init(
        start:        String,
        end:          String
    ) {
        self.start        = start
        self.end          = end
    }
}
