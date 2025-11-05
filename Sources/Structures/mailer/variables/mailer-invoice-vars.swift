import Foundation
import Combine
import SwiftUI
import plate

// invoice - /issue, /expired, /issue/simple
public struct MailerAPIInvoiceVariables: Encodable {
    public var name:          String
    public var client_name:   String
    public var email:         String
    public var invoice_id:    String
    public var due_date:      String
    public var product_line:  String
    public var amount:        String
    public var vat_percentage:String
    public var vat_amount:    String
    public var total:         String
    public var terms_total:   String
    public var terms_current: String

    public var invoice_number: String

    public init(
        clientName:    String,
        email:         String,
        invoiceId:     String,
        dueDate:       String,
        productLine:   String,
        amount:        String,
        vatPercentage: String,
        vatAmount:     String,
        total:         String,
        termsTotal:    String,
        termsCurrent:  String
    ) {
        self.name           = clientName
        self.client_name    = clientName
        self.email          = email
        self.invoice_id     = invoiceId
        self.due_date       = dueDate
        self.product_line   = productLine
        self.amount         = amount
        self.vat_percentage = vatPercentage
        self.vat_amount     = vatAmount
        self.total          = total
        self.terms_total    = termsTotal
        self.terms_current  = termsCurrent

        self.invoice_number = invoiceId
     }

    // init with blank defaults
    public init() {
        self.name           = ""
        self.client_name    = ""
        self.email          = ""
        self.invoice_id     = ""
        self.due_date       = ""
        self.product_line   = ""
        self.amount         = ""
        self.vat_percentage = ""
        self.vat_amount     = ""
        self.total          = ""
        self.terms_total    = ""
        self.terms_current  = ""
        self.invoice_number = ""
    }
}
