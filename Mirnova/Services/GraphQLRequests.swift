// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CourseInfoQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CourseInfo($user: String!) {
      Courses {
        __typename
        name
        questionCount
      }
      Completions(user: $user) {
        __typename
        course
        completed
        questionsMissed
        points
        numberOfTries
      }
    }
    """

  public let operationName: String = "CourseInfo"

  public var user: String

  public init(user: String) {
    self.user = user
  }

  public var variables: GraphQLMap? {
    return ["user": user]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Courses", type: .list(.object(Course.selections))),
      GraphQLField("Completions", arguments: ["user": GraphQLVariable("user")], type: .list(.nonNull(.object(Completion.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(courses: [Course?]? = nil, completions: [Completion]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Courses": courses.flatMap { (value: [Course?]) -> [ResultMap?] in value.map { (value: Course?) -> ResultMap? in value.flatMap { (value: Course) -> ResultMap in value.resultMap } } }, "Completions": completions.flatMap { (value: [Completion]) -> [ResultMap] in value.map { (value: Completion) -> ResultMap in value.resultMap } }])
    }

    public var courses: [Course?]? {
      get {
        return (resultMap["Courses"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Course?] in value.map { (value: ResultMap?) -> Course? in value.flatMap { (value: ResultMap) -> Course in Course(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Course?]) -> [ResultMap?] in value.map { (value: Course?) -> ResultMap? in value.flatMap { (value: Course) -> ResultMap in value.resultMap } } }, forKey: "Courses")
      }
    }

    public var completions: [Completion]? {
      get {
        return (resultMap["Completions"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Completion] in value.map { (value: ResultMap) -> Completion in Completion(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Completion]) -> [ResultMap] in value.map { (value: Completion) -> ResultMap in value.resultMap } }, forKey: "Completions")
      }
    }

    public struct Course: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Course"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("questionCount", type: .nonNull(.scalar(Int.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, questionCount: Int) {
        self.init(unsafeResultMap: ["__typename": "Course", "name": name, "questionCount": questionCount])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var questionCount: Int {
        get {
          return resultMap["questionCount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "questionCount")
        }
      }
    }

    public struct Completion: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Completion"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("course", type: .nonNull(.scalar(String.self))),
        GraphQLField("completed", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("questionsMissed", type: .list(.nonNull(.scalar(String.self)))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("numberOfTries", type: .nonNull(.scalar(Int.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(course: String, completed: Bool, questionsMissed: [String]? = nil, points: Int, numberOfTries: Int) {
        self.init(unsafeResultMap: ["__typename": "Completion", "course": course, "completed": completed, "questionsMissed": questionsMissed, "points": points, "numberOfTries": numberOfTries])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var course: String {
        get {
          return resultMap["course"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "course")
        }
      }

      public var completed: Bool {
        get {
          return resultMap["completed"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "completed")
        }
      }

      public var questionsMissed: [String]? {
        get {
          return resultMap["questionsMissed"] as? [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "questionsMissed")
        }
      }

      public var points: Int {
        get {
          return resultMap["points"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "points")
        }
      }

      public var numberOfTries: Int {
        get {
          return resultMap["numberOfTries"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "numberOfTries")
        }
      }
    }
  }
}

public final class CourseQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Course($name: String!) {
      Course(name: $name) {
        __typename
        questions {
          __typename
          question
          answer
          images
        }
      }
    }
    """

  public let operationName: String = "Course"

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Course", arguments: ["name": GraphQLVariable("name")], type: .object(Course.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(course: Course? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Course": course.flatMap { (value: Course) -> ResultMap in value.resultMap }])
    }

    public var course: Course? {
      get {
        return (resultMap["Course"] as? ResultMap).flatMap { Course(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Course")
      }
    }

    public struct Course: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Course"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("questions", type: .nonNull(.list(.nonNull(.object(Question.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(questions: [Question]) {
        self.init(unsafeResultMap: ["__typename": "Course", "questions": questions.map { (value: Question) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var questions: [Question] {
        get {
          return (resultMap["questions"] as! [ResultMap]).map { (value: ResultMap) -> Question in Question(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Question) -> ResultMap in value.resultMap }, forKey: "questions")
        }
      }

      public struct Question: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Questions"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("question", type: .nonNull(.scalar(String.self))),
          GraphQLField("answer", type: .nonNull(.scalar(String.self))),
          GraphQLField("images", type: .list(.nonNull(.scalar(String.self)))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(question: String, answer: String, images: [String]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Questions", "question": question, "answer": answer, "images": images])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var question: String {
          get {
            return resultMap["question"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "question")
          }
        }

        public var answer: String {
          get {
            return resultMap["answer"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "answer")
          }
        }

        public var images: [String]? {
          get {
            return resultMap["images"] as? [String]
          }
          set {
            resultMap.updateValue(newValue, forKey: "images")
          }
        }
      }
    }
  }
}
