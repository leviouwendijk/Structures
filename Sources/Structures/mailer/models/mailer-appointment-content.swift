import Foundation
import SwiftUI
import Combine
import plate

// content of appointment var 
public struct MailerAPIAppointmentContent: Codable, Identifiable {
    public let id:       UUID
    public let date:     String
    public let time:     String
    public let day:      String
    public let street:   String
    public let number:   String
    public let area:     String
    public let location: String
    public let dateComponents:  DateComponents

    public init(
        id:       UUID = UUID(),
        date:     String,
        time:     String,
        day:      String,
        street:   String,
        number:   String,
        area:     String,
        location: String,
        dateComponents:  DateComponents
    ) {
        self.id       = id
        self.date     = date
        self.time     = time
        self.day      = day
        self.street   = street
        self.number   = number
        self.area     = area
        self.location = location
        self.dateComponents = dateComponents
    }

    public func writtenDate(in locale: WrittenDateLocale = .nl) throws -> String? {
        let calendar = Calendar.current
        guard let date = calendar.date(from: dateComponents) else {
            throw MailerAPIAppointmentError.cannotConstructDateFromComponents
        }
        return date.written(in: locale)
    }
}

extension Array where Element == MailerAPIAppointmentContent {
    public func jsonString() throws -> String {
        try appointmentsQueueToJSON(self)
    }
}

public func appointmentsQueueToJSON(_ appointments: [MailerAPIAppointmentContent]) throws -> String {
    let encoder = JSONEncoder()
    let jsonData = try encoder.encode(appointments)
    var jsonString = String(data: jsonData, encoding: .utf8) ?? "[]"

    // Escape for Zsh (we're using '-c' and wrapping in single quotes)
    jsonString = jsonString.replacingOccurrences(of: "'", with: "'\\''")

    return jsonString
}
