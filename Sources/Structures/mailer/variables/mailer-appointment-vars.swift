import Foundation
import Combine
import SwiftUI
import plate

public struct MailerAPIAppointmentAvailabilityVariables: Encodable {
    public let name:          String
    public let dog:           String
    public let email:         String
    public let session_count: Int
    public let reflection:    Bool
    public let blocked_weekdays: [MailerAPIBlockedWeekday]
    
    public init(
        name: String,
        dog: String,
        email: String,
        session_count: Int,
        reflection: Bool,
        blocked_weekdays: [MailerAPIBlockedWeekday] = []
    ) {
        self.name = name
        self.dog = dog
        self.email = email
        self.session_count = session_count
        self.reflection = reflection
        self.blocked_weekdays = blocked_weekdays
    }
}

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

public enum MailerAPIAppointmentError: Error, CustomStringConvertible {
    case cannotConstructDateFromComponents

    public var description: String {
        switch self {
            case .cannotConstructDateFromComponents:
            return "The dateComponents value for MailerAPIAppointmentContent cannot produce a valid date"
        }
    }
}
