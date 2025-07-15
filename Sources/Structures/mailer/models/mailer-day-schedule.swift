import Foundation

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
