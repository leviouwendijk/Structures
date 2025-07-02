import Foundation
import plate

public struct ExpirationDateRange: Sendable {
    public let start: Date
    public let end: Date
    
    public init(
        start: Date,
        end: Date
    ) {
        self.start = start
        self.end = end
    }

    public var string: String {
        return "\(start.formatted()) - \(end.formatted())"
    }
}

public struct ExpirationSetting: Sendable {
    public let dates: ExpirationDateRange

    public init(using dates: ExpirationDateRange) {
        self.dates = dates
    }
    
    public init(from start: String, to end: String) throws {
        let s = try start.date()
        let e = try end.date()

        self.dates = ExpirationDateRange(start: s, end: e)
    }

    public init(from start: String, interval: DateComponents) throws {
        let s = try start.date()
        let e = s + interval

        self.dates = ExpirationDateRange(start: s, end: e)
    }
}
