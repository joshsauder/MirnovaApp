// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct CompletionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - user
  ///   - course
  ///   - completed
  ///   - points
  public init(user: String, course: String, completed: Bool, points: Int) {
    graphQLMap = ["user": user, "course": course, "completed": completed, "points": points]
  }

  public var user: String {
    get {
      return graphQLMap["user"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }

  public var course: String {
    get {
      return graphQLMap["course"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "course")
    }
  }

  public var completed: Bool {
    get {
      return graphQLMap["completed"] as! Bool
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "completed")
    }
  }

  public var points: Int {
    get {
      return graphQLMap["points"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "points")
    }
  }
}

public struct InputUser: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - name
  public init(email: String, name: String) {
    graphQLMap = ["email": email, "name": name]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }
}

public final class CourseInfoQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CourseInfo($user: String!) {
      Courses {
        __typename
        name
        image
        questionCount
      }
      Completions(user: $user) {
        __typename
        course
        completed
        points
        numberOfTries
        average
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
        GraphQLField("image", type: .nonNull(.scalar(String.self))),
        GraphQLField("questionCount", type: .nonNull(.scalar(Int.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, image: String, questionCount: Int) {
        self.init(unsafeResultMap: ["__typename": "Course", "name": name, "image": image, "questionCount": questionCount])
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

      public var image: String {
        get {
          return resultMap["image"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
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
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("numberOfTries", type: .nonNull(.scalar(Int.self))),
        GraphQLField("average", type: .nonNull(.scalar(Double.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(course: String, completed: Bool, points: Int, numberOfTries: Int, average: Double) {
        self.init(unsafeResultMap: ["__typename": "Completion", "course": course, "completed": completed, "points": points, "numberOfTries": numberOfTries, "average": average])
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

      public var average: Double {
        get {
          return resultMap["average"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "average")
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
          image
        }
        image
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
        GraphQLField("image", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(questions: [Question], image: String) {
        self.init(unsafeResultMap: ["__typename": "Course", "questions": questions.map { (value: Question) -> ResultMap in value.resultMap }, "image": image])
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

      public var image: String {
        get {
          return resultMap["image"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public struct Question: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Questions"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("question", type: .nonNull(.scalar(String.self))),
          GraphQLField("answer", type: .nonNull(.scalar(String.self))),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(question: String, answer: String, image: String) {
          self.init(unsafeResultMap: ["__typename": "Questions", "question": question, "answer": answer, "image": image])
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

        public var image: String {
          get {
            return resultMap["image"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }
      }
    }
  }
}

public final class UpdateCompletionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation updateCompletion($completion: CompletionInput!) {
      updateCompletion(completion: $completion) {
        __typename
        numberOfTries
        average
      }
    }
    """

  public let operationName: String = "updateCompletion"

  public var completion: CompletionInput

  public init(completion: CompletionInput) {
    self.completion = completion
  }

  public var variables: GraphQLMap? {
    return ["completion": completion]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateCompletion", arguments: ["completion": GraphQLVariable("completion")], type: .nonNull(.object(UpdateCompletion.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateCompletion: UpdateCompletion) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateCompletion": updateCompletion.resultMap])
    }

    public var updateCompletion: UpdateCompletion {
      get {
        return UpdateCompletion(unsafeResultMap: resultMap["updateCompletion"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateCompletion")
      }
    }

    public struct UpdateCompletion: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Completion"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("numberOfTries", type: .nonNull(.scalar(Int.self))),
        GraphQLField("average", type: .nonNull(.scalar(Double.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(numberOfTries: Int, average: Double) {
        self.init(unsafeResultMap: ["__typename": "Completion", "numberOfTries": numberOfTries, "average": average])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var average: Double {
        get {
          return resultMap["average"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "average")
        }
      }
    }
  }
}

public final class NewUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation newUser($user: InputUser!) {
      createUser(user: $user) {
        __typename
        name
        id
      }
    }
    """

  public let operationName: String = "newUser"

  public var user: InputUser

  public init(user: InputUser) {
    self.user = user
  }

  public var variables: GraphQLMap? {
    return ["user": user]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["user": GraphQLVariable("user")], type: .object(CreateUser.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createUser: CreateUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createUser": createUser.flatMap { (value: CreateUser) -> ResultMap in value.resultMap }])
    }

    public var createUser: CreateUser? {
      get {
        return (resultMap["createUser"] as? ResultMap).flatMap { CreateUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "User", "name": name, "id": id])
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

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}
