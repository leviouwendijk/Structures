import Foundation
import Combine
import SwiftUI
import plate

// custom -- /message/send
public struct MailerAPICustomVariables: Encodable {
    public let body:       String
    // public let time_range: [String:[String:String]]?
    public let time_range: MailerAPIAvailabilityContent?

    public init(
        body:         String,
        availability schedules: [MailerAPIWeekday: MailerAPIDaySchedule]? = nil
    ) {
        self.body = body
        if let schedules = schedules {
            self.time_range = MailerAPIAvailabilityContent(from: schedules)
        } else {
            self.time_range = nil
        }
    }
}
