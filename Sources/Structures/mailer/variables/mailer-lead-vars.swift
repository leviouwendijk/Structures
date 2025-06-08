import Foundation
import Combine
import SwiftUI
import plate

// lead -- /confirmation, /follow, /check
public struct MailerAPILeadVariables: Encodable {
    public let name:       String
    public let dog:        String

    // public let time_range: [String:[String:String]]?
    public let time_range: MailerAPIAvailabilityContent?

    public init(
        name:       String,
        dog:        String,
        availability schedules: [MailerAPIWeekday: MailerAPIDaySchedule]? = nil
    ) {
        self.name       = name
        self.dog        = dog
        if let schedules = schedules {
            self.time_range = MailerAPIAvailabilityContent(from: schedules)
        } else {
            self.time_range = nil
        }
    }
}
