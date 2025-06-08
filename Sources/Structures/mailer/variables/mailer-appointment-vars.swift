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
public struct MailerAPIAppointmentContent: Encodable {
    public let date:     String
    public let time:     String
    public let day:      String
    public let street:   String
    public let number:   String
    public let area:     String
    public let location: String

    public init(
        date:     String,
        time:     String,
        day:      String,
        street:   String,
        number:   String,
        area:     String,
        location: String
    ) {
        self.date     = date
        self.time     = time
        self.day      = day
        self.street   = street
        self.number   = number
        self.area     = area
        self.location = location
    }
}
