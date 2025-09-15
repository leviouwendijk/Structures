import Foundation
import Combine
import SwiftUI
import plate

// support -- /catch
public struct MailerAPISupportVariables: Encodable {
    public let name:       String
    public let dog:        String

    public init(name: String, dog: String) {
        self.name = name
        self.dog  = dog
    }
}
