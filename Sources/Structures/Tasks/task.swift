import Foundation

public enum TaskDepartment: String, CaseIterable, Identifiable {
    case marketing   = "Marketing"
    case development = "Development"
    case sales       = "Sales"
    case hr          = "HR"
    public var id: String { rawValue }
}

public struct TaskProject: Identifiable {
    public let id: UUID
    public var name: String

    public init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}

public struct TaskItem: Identifiable {
    public let id: UUID
    public var title: String
    public var description: String
    public var dateCreated: Date
    public var deadline: Date
    public var urgency: Int       // 1...5
    public var importance: Int    // 1...5
    public var project: TaskProject
    public var department: TaskDepartment
    public var completion: Bool

    public init(
        id: UUID = UUID(),
        title: String,
        description: String,
        dateCreated: Date = Date(),
        deadline: Date,
        urgency: Int,
        importance: Int,
        project: TaskProject,
        department: TaskDepartment,
        completion: Bool = false
    ) {
        self.id          = id
        self.title       = title
        self.description = description
        self.dateCreated = dateCreated
        self.deadline    = deadline
        self.urgency     = urgency
        self.importance  = importance
        self.project     = project
        self.department  = department
        self.completion  = completion
    }
}

public enum TaskSortOption: String, CaseIterable, Identifiable {
    case urgencyDesc      = "Urgency ↓"
    case urgencyAsc       = "Urgency ↑"
    case importanceDesc   = "Importance ↓"
    case importanceAsc    = "Importance ↑"
    case dateCreatedDesc  = "Created ↓"
    case dateCreatedAsc   = "Created ↑"
    case deadlineDesc     = "Deadline ↓"
    case deadlineAsc      = "Deadline ↑"

    public var id: String { rawValue }
}
