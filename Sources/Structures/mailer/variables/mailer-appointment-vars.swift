import Foundation
import Combine
import SwiftUI
import plate

public struct MailerAPIAppointmentVariables: Encodable {
    public let name:         String
    public let dog:          String
    public let appointments: [MailerAPIAppointmentContent]

    // public let ics_files:    [String]?  // base64‐encoded ICS blobs
    // handle ICS in payload initializer?

    public init(
        name:         String,
        dog:          String,
        appointments: [MailerAPIAppointmentContent]
    ) {
        self.name         = name
        self.dog          = dog
        self.appointments = appointments
    }
}

// content of appointment var 
public struct MailerAPIAppointmentContent: Encodable, Identifiable {
    public let id:       UUID
    public let date:     String
    public let time:     String
    public let day:      String
    public let street:   String
    public let number:   String
    public let area:     String
    public let location: String

    public init(
        id:       UUID = UUID(),
        date:     String,
        time:     String,
        day:      String,
        street:   String,
        number:   String,
        area:     String,
        location: String
    ) {
        self.id       = id
        self.date     = date
        self.time     = time
        self.day      = day
        self.street   = street
        self.number   = number
        self.area     = area
        self.location = location
    }
}

extension Array where Element == MailerAPIAppointmentContent {
    public func jsonString() -> String {
        appointmentsQueueToJSON(self)
    }
}

public func appointmentsQueueToJSON(_ appointments: [MailerAPIAppointmentContent]) -> String {
    let encoder = JSONEncoder()
    do {
        let jsonData = try encoder.encode(appointments)
        var jsonString = String(data: jsonData, encoding: .utf8) ?? "[]"

        // Escape for Zsh (we're using '-c' and wrapping in single quotes)
        jsonString = jsonString.replacingOccurrences(of: "'", with: "'\\''")

        return "'\(jsonString)'" // wrap entire thing in single quotes for shell
    } catch {
        print("Failed to encode appointments: \(error)")
        return "'[]'"
    }
}
