import Foundation
import Combine
import SwiftUI
import plate

// custom -- /template/fetch
public struct MailerAPITemplateVariables: Encodable {
    public let category:    String
    public let file:        String

    public init(category: String, file: String) {
        self.category = category
        self.file     = file
    }
}
