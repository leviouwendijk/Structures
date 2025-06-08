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

public enum MailerAPIWeekday: String, RawRepresentable, CaseIterable, Identifiable, Encodable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    public var id: String { rawValue }

    public var dutch: String {
        switch self {
            case .monday: return "Maandag"
            case .tuesday: return "Dinsdag"
            case .wednesday: return "Woensdag"
            case .thursday: return "Donderdag"
            case .friday: return "Vrijdag"
            case .saturday: return "Zaterdag"
            case .sunday: return "Zondag"
        }
    }
}

public struct MailerAPIDaySchedule: Encodable {
    public var enabled: Bool
    public var start:   Date
    public var end:     Date

    public init(defaultsFor day: MailerAPIWeekday) {
        let cal   = Calendar.current
        let today = Date()
        func at(_ hour: Int, _ minute: Int) -> Date {
            return cal.date(
              bySettingHour: hour,
              minute: minute,
              second: 0,
              of: today
            )!
        }

        switch day {
        case .monday:
            enabled = true
            start   = at(18, 0)
            end     = at(21, 0)
        case .tuesday:
            enabled = true
            start   = at(10, 0)
            end     = at(21, 0)
        case .wednesday:
            enabled = true
            start   = at(18, 0)
            end     = at(21, 0)
        case .thursday:
            enabled = true
            start   = at(18, 0)
            end     = at(21, 0)
        case .friday:
            enabled = true
            start   = at(10, 0)
            end     = at(21, 0)
        case .saturday:
            enabled = true
            start   = at(18, 0)
            end     = at(21, 0)
        case .sunday:
            enabled = true
            start   = at(18, 0)
            end     = at(21, 0)
        }
    }
}
