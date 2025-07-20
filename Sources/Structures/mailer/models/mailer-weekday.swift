import Foundation

public enum MailerAPIWeekday: String, RawRepresentable, CaseIterable, Identifiable, Codable {
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

    public var english: String {
        return self.rawValue
    }
}
