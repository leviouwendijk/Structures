import Foundation

public struct AgreementDeliverableSessionDurationRange: Encodable, Sendable {
    public var fromMinutes: Int
    public var toMinutes: Int
    
    public init(
        fromMinutes: Int = 45,
        toMinutes: Int = 60
    ) {
        self.fromMinutes = fromMinutes
        self.toMinutes = toMinutes
    }

    public var str: String {
        return "\(fromMinutes) - \(toMinutes) min."
    }
}

// public struct AgreementDeliverableSessions: Encodable, Sendable {
//     // public var count: Int
//     public var count: AgreementDeliverableSessionCount
//     public var duration: AgreementDeliverableSessionDurationRange
    
//     public init(
//         // count: Int,
//         count: AgreementDeliverableSessionCount,
//         duration: AgreementDeliverableSessionDurationRange = AgreementDeliverableSessionDurationRange()
//     ) {
//         self.count = count
//         self.duration = duration
//     }

//     public var countText: String {
//         switch count {
//         case .exact(let n):
//             return "\(n)"
//         case .range(let r):
//             if r.low == r.high { return "\(r.low)" }
//             return "\(r.low)–\(r.high)"
//         case .text(let t):
//             return t
//         }
//     }

//     // public var label: String {
//     //     SessionLabel(count: count.).dutch
//     // }

//     public var label: String {
//         switch count {
//         case .exact(let n):
//             return SessionLabel(count: n).dutch
//         case .range:
//             // pick whatever generic word you want here
//             return "sessies"
//         case .text:
//             // if text is like "in overleg", you probably don't want to append "sessies"
//             return ""
//         }
//     }

//     // public var str: String {
//     //     return "\(count) \(label) (± \(duration.str))"
//     // }
//     public var str: String {
//         let base = countText.isEmpty ? "" : countText
//         let labelPart = label.isEmpty ? "" : " \(label)"
//         return "\(base)\(labelPart) (± \(duration.str))"
//             .trimmingCharacters(in: .whitespaces)
//     }
// }

public struct AgreementDeliverableSessions: Encodable, Sendable {
    public var count: AgreementDeliverableSessionCount?
    public var duration: AgreementDeliverableSessionDurationRange

    public init(
        count: AgreementDeliverableSessionCount?,
        duration: AgreementDeliverableSessionDurationRange = AgreementDeliverableSessionDurationRange()
    ) {
        self.count = count
        self.duration = duration
    }

    public var countText: String {
        guard let count else { return "" }
        switch count {
        case .exact(let n):
            return "\(n)"
        case .range(let r):
            if r.low == r.high { return "\(r.low)" }
            return "\(r.low)–\(r.high)"
        case .text(let t):
            return t
        }
    }

    public var label: String {
        guard let count else { return "" }
        switch count {
        case .exact(let n):
            return SessionLabel(count: n).dutch
        case .range:
            return "sessies"
        case .text:
            return ""
        }
    }

    public var str: String {
        let base = countText.isEmpty ? "" : countText
        let labelPart = label.isEmpty ? "" : " \(label)"
        let core = "\(base)\(labelPart)".trimmingCharacters(in: .whitespaces)
        if core.isEmpty {
            return "(± \(duration.str))"
        }
        return "\(core) (± \(duration.str))"
    }
}

public struct AgreementDeliverable: Encodable, Sendable {
    public var name: String
    public var sessions: AgreementDeliverableSessions
    public var price: Double
    
    public init(
        name: String,
        sessions: AgreementDeliverableSessions,
        price: Double
    ) {
        self.name = name
        self.sessions = sessions
        self.price = price
    }
}


// new: range
public struct AgreementDeliverableSessionRange: Codable, Sendable {
    public let low: Int
    public let high: Int

    public init(low: Int, high: Int) {
        precondition(low >= 0)
        precondition(high >= low)
        self.low = low
        self.high = high
    }
}

public enum AgreementDeliverableSessionCount: Codable, Sendable {
    case exact(Int)
    case range(AgreementDeliverableSessionRange)
    case text(String)

    private enum CodingKeys: String, CodingKey {
        case kind
        case value
        case low
        case high
        case text
    }

    public func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .exact(let v):
            try c.encode("exact", forKey: .kind)
            try c.encode(v, forKey: .value)
        case .range(let r):
            try c.encode("range", forKey: .kind)
            try c.encode(r.low, forKey: .low)
            try c.encode(r.high, forKey: .high)
        case .text(let t):
            try c.encode("text", forKey: .kind)
            try c.encode(t, forKey: .text)
        }
    }

    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        let kind = try c.decode(String.self, forKey: .kind)
        switch kind {
        case "exact":
            self = .exact(try c.decode(Int.self, forKey: .value))
        case "range":
            let low = try c.decode(Int.self, forKey: .low)
            let high = try c.decode(Int.self, forKey: .high)
            self = .range(AgreementDeliverableSessionRange(low: low, high: high))
        case "text":
            self = .text(try c.decode(String.self, forKey: .text))
        default:
            throw DecodingError.dataCorruptedError(forKey: .kind, in: c, debugDescription: "Unknown SessionCount kind")
        }
    }
}
