import Foundation

public struct AgreementDeliverableSessionDurationRange: Sendable {
    public var fromMinutes: Int
    public var toMinutes: Int
    
    public init(
        fromMinutes: Int = 60,
        toMinutes: Int = 120
    ) {
        self.fromMinutes = fromMinutes
        self.toMinutes = toMinutes
    }

    public var str: String {
        return "\(fromMinutes) - \(toMinutes) min."
    }
}

public struct AgreementDeliverableSessions: Sendable {
    public var count: Int
    public var duration: AgreementDeliverableSessionDurationRange
    
    public init(
        count: Int,
        duration: AgreementDeliverableSessionDurationRange = AgreementDeliverableSessionDurationRange()
    ) {
        self.count = count
        self.duration = duration
    }

    public var label: String {
        SessionLabel(count: count).dutch
    }

    public var str: String {
        return "\(count) \(self.label) (± \(duration.str))"
    }
}

public struct AgreementDeliverable: Sendable {
    public var name: String
    public var sessions: AgreementDeliverableSessions
    public var price: Double
    
    public init(
        name: String,
        sessions: AgreementDeliverableSessions,
        price: Double
    ) {
        self.name = name
        self.sessions = sessions
        self.price = price
    }
}
