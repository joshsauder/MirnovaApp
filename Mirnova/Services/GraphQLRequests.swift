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
      GraphQLField("Completions", arguments: ["user": GraphQLVariable("user")], type: .list(.object(Completion.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(courses: [Course?]? = nil, completions: [Completion?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Courses": courses.flatMap { (value: [Course?]) -> [ResultMap?] in value.map { (value: Course?) -> ResultMap? in value.flatMap { (value: Course) -> ResultMap in value.resultMap } } }, "Completions": completions.flatMap { (value: [Completion?]) -> [ResultMap?] in value.map { (value: Completion?) -> ResultMap? in value.flatMap { (value: Completion) -> ResultMap in value.resultMap } } }])
    }

    public var courses: [Course?]? {
      get {
        return (resultMap["Courses"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Course?] in value.map { (value: ResultMap?) -> Course? in value.flatMap { (value: ResultMap) -> Course in Course(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Course?]) -> [ResultMap?] in value.map { (value: Course?) -> ResultMap? in value.flatMap { (value: Course) -> ResultMap in value.resultMap } } }, forKey: "Courses")
      }
    }

    public var completions: [Completion?]? {
      get {
        return (resultMap["Completions"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Completion?] in value.map { (value: ResultMap?) -> Completion? in value.flatMap { (value: ResultMap) -> Completion in Completion(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Completion?]) -> [ResultMap?] in value.map { (value: Completion?) -> ResultMap? in value.flatMap { (value: Completion) -> ResultMap in value.resultMap } } }, forKey: "Completions")
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
        GraphQLField("questionsMissed", type: .list(.scalar(String.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(course: String, completed: Bool, questionsMissed: [String?]? = nil, points: Int) {
        self.init(unsafeResultMap: ["__typename": "Completion", "course": course, "completed": completed, "questionsMissed": questionsMissed, "points": points])
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

      public var questionsMissed: [String?]? {
        get {
          return resultMap["questionsMissed"] as? [String?]
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
    }
  }
}
