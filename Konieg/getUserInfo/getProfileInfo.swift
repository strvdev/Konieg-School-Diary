//
//  getProfileInfo.swift
//  Konieg
//
//  Created by David I on 19.12.2024.
//
import Foundation

// MARK: - Welcome
struct Welcome: Codable {
let id: Int
let createdAt, updatedAt: String
let deletedAt: JSONNull?
let personID: String
let transferred: Bool
let schoolID: Int
let organizationID: String
let userID, studyModeID: Int
let userName, shortName: String
let lastName, firstName, middleName: JSONNull?
let changePasswordRequired: Bool
let birthDate: String
let enlistedOn: JSONNull?
let gusoevLogin: String
let age: Int
let sex: String
let deleted: Bool
let email, phoneNumber, emailEzd, phoneNumberEzd: JSONNull?
let classUnit: ClassUnit
let previouslyClassUnit: JSONNull?
let curricula: ClassUnit
let nonAttendance: Int
let mentors: [Mentor]
let isppAccount: Int
let previouslyProfileID, studentViewed, migrationDate: JSONNull?
let educationLevel, classLevel: String
let physicalTrainingGroupID: Int
let snils, lastSignInAt: JSONNull?
let groups: [Group]
let parents: [Parent]
let marks: [Mark]
let finalMarks: [FinalMark]
let attendances, lessonComments, homeBasedPeriods: [JSONAny]
let subjects: [Mentor]
let aeAttendances, ecAttendances, assignments, aeGroups: [JSONAny]
let leftOnRegistry: JSONNull?


enum CodingKeys: String, CodingKey {
    case id
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case deletedAt = "deleted_at"
    case personID = "person_id"
    case transferred
    case schoolID = "school_id"
    case organizationID = "organization_id"
    case userID = "user_id"
    case studyModeID = "study_mode_id"
    case userName = "user_name"
    case shortName = "short_name"
    case lastName = "last_name"
    case firstName = "first_name"
    case middleName = "middle_name"
    case changePasswordRequired = "change_password_required"
    case birthDate = "birth_date"
    case enlistedOn = "enlisted_on"
    case gusoevLogin = "gusoev_login"
    case age, sex, deleted, email
    case phoneNumber = "phone_number"
    case emailEzd = "email_ezd"
    case phoneNumberEzd = "phone_number_ezd"
    case classUnit = "class_unit"
    case previouslyClassUnit = "previously_class_unit"
    case curricula
    case nonAttendance = "non_attendance"
    case mentors
    case isppAccount = "ispp_account"
    case previouslyProfileID = "previously_profile_id"
    case studentViewed = "student_viewed"
    case migrationDate = "migration_date"
    case educationLevel = "education_level"
    case classLevel = "class_level"
    case physicalTrainingGroupID = "physical_training_group_id"
    case snils
    case lastSignInAt = "last_sign_in_at"
    case groups, parents, marks
    case finalMarks = "final_marks"
    case attendances
    case lessonComments = "lesson_comments"
    case homeBasedPeriods = "home_based_periods"
    case subjects
    case aeAttendances = "ae_attendances"
    case ecAttendances = "ec_attendances"
    case assignments
    case aeGroups = "ae_groups"
    case leftOnRegistry = "left_on_registry"
}
}

// MARK: - ClassUnit
struct ClassUnit: Codable {
let id: Int
let classLevelID: Int?
let name: String
let homeBased: Bool?


enum CodingKeys: String, CodingKey {
    case id
    case classLevelID = "class_level_id"
    case name
    case homeBased = "home_based"
}
}

// MARK: - FinalMark
struct FinalMark: Codable {
let id: Int
let createdAt, updatedAt, deletedAt: JSONNull?
let value: Int
let gradeID, personID: JSONNull?
let gradeSystemType: GradeSystemType
let academicYearID: Int
let moduleID, periodID: JSONNull?
let attestationPeriodID: Int
let isYearMark: Bool
let subjectID, studentProfileID: Int
let attested, academicDebt, noMark: Bool
let comment: String
let markType: JSONNull?
let yearMark, isGoodReason: Bool
let manualValue: JSONNull?
let eliminated: Bool


enum CodingKeys: String, CodingKey {
    case id
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case deletedAt = "deleted_at"
    case value
    case gradeID = "grade_id"
    case personID = "person_id"
    case gradeSystemType = "grade_system_type"
    case academicYearID = "academic_year_id"
    case moduleID = "module_id"
    case periodID = "period_id"
    case attestationPeriodID = "attestation_period_id"
    case isYearMark = "is_year_mark"
    case subjectID = "subject_id"
    case studentProfileID = "student_profile_id"
    case attested
    case academicDebt = "academic_debt"
    case noMark = "no_mark"
    case comment
    case markType = "mark_type"
    case yearMark = "year_mark"
    case isGoodReason = "is_good_reason"
    case manualValue = "manual_value"
    case eliminated
}
}

enum GradeSystemType: String, Codable {
case five = "five"
}

// MARK: - Group
struct Group: Codable {
let userProfileID, id: Int
let name: String
let beginDate: BeginDate
let endDate: EndDate
let subgroupIDS: [Int]?
let classUnitIDS: [Int]
let metagroup, archived: Bool


enum CodingKeys: String, CodingKey {
    case userProfileID = "user_profile_id"
    case id, name
    case beginDate = "begin_date"
    case endDate = "end_date"
    case subgroupIDS = "subgroup_ids"
    case classUnitIDS = "class_unit_ids"
    case metagroup, archived
}
}

enum BeginDate: String, Codable {
case the01092024 = "01.09.2024"
}

enum EndDate: String, Codable {
case the31082025 = "31.08.2025"
}

// MARK: - Mark
struct Mark: Codable {
let id, studentProfileID: Int
let name: String
let weight, teacherID: Int
let comment: String?
let controlFormID, scheduleLessonID, subjectID, gradeSystemID: Int
let gradeSystemType: GradeSystemType
let pointValue, date: String
let pointDate: JSONNull?
let isPoint: Bool
let values: [Value]
let exam: Bool


enum CodingKeys: String, CodingKey {
    case id
    case studentProfileID = "student_profile_id"
    case name, weight
    case teacherID = "teacher_id"
    case comment
    case controlFormID = "control_form_id"
    case scheduleLessonID = "schedule_lesson_id"
    case subjectID = "subject_id"
    case gradeSystemID = "grade_system_id"
    case gradeSystemType = "grade_system_type"
    case pointValue = "point_value"
    case date
    case pointDate = "point_date"
    case isPoint = "is_point"
    case values, exam
}
}

// MARK: - Value
struct Value: Codable {
let gradeSystemID: Int
let name: JSONNull?
let nmax: Int
let grade: Grade


enum CodingKeys: String, CodingKey {
    case gradeSystemID = "grade_system_id"
    case name, nmax, grade
}
}

// MARK: - Grade
struct Grade: Codable {
let origin, five, hundred: Int
}

// MARK: - Mentor
struct Mentor: Codable {
let id: Int
let name: String
}

// MARK: - Parent
struct Parent: Codable {
let id, userID: Int
let personID, type, gusoevLogin, name: String
let phoneNumberEzd, emailEzd: JSONNull?
let phoneNumber, email: String
let snils, lastSignInAt: JSONNull?
let hidden: Bool


enum CodingKeys: String, CodingKey {
    case id
    case userID = "user_id"
    case personID = "person_id"
    case type
    case gusoevLogin = "gusoev_login"
    case name
    case phoneNumberEzd = "phone_number_ezd"
    case emailEzd = "email_ezd"
    case phoneNumber = "phone_number"
    case email, snils
    case lastSignInAt = "last_sign_in_at"
    case hidden
}
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {


public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
}

public var hashValue: Int {
        return 0
}

public init() {}

public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
}

public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
}
}

class JSONCodingKey: CodingKey {
let key: String


required init?(intValue: Int) {
        return nil
}

required init?(stringValue: String) {
        key = stringValue
}

var intValue: Int? {
        return nil
}

var stringValue: String {
        return key
}
}

class JSONAny: Codable {


let value: Any

static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
}

static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
}

static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
                return value
        }
        if let value = try? container.decode(Int64.self) {
                return value
        }
        if let value = try? container.decode(Double.self) {
                return value
        }
        if let value = try? container.decode(String.self) {
                return value
        }
        if container.decodeNil() {
                return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
}

static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
                return value
        }
        if let value = try? container.decode(Int64.self) {
                return value
        }
        if let value = try? container.decode(Double.self) {
                return value
        }
        if let value = try? container.decode(String.self) {
                return value
        }
        if let value = try? container.decodeNil() {
                if value {
                        return JSONNull()
                }
        }
        if var container = try? container.nestedUnkeyedContainer() {
                return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
                return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
}

static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
                return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
                return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
                return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
                return value
        }
        if let value = try? container.decodeNil(forKey: key) {
                if value {
                        return JSONNull()
                }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
                return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
                return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
}

static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
                let value = try decode(from: &container)
                arr.append(value)
        }
        return arr
}

static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
                let value = try decode(from: &container, forKey: key)
                dict[key.stringValue] = value
        }
        return dict
}

static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
                if let value = value as? Bool {
                        try container.encode(value)
                } else if let value = value as? Int64 {
                        try container.encode(value)
                } else if let value = value as? Double {
                        try container.encode(value)
                } else if let value = value as? String {
                        try container.encode(value)
                } else if value is JSONNull {
                        try container.encodeNil()
                } else if let value = value as? [Any] {
                        var container = container.nestedUnkeyedContainer()
                        try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                        var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                        try encode(to: &container, dictionary: value)
                } else {
                        throw encodingError(forValue: value, codingPath: container.codingPath)
                }
        }
}

static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
                let key = JSONCodingKey(stringValue: key)!
                if let value = value as? Bool {
                        try container.encode(value, forKey: key)
                } else if let value = value as? Int64 {
                        try container.encode(value, forKey: key)
                } else if let value = value as? Double {
                        try container.encode(value, forKey: key)
                } else if let value = value as? String {
                        try container.encode(value, forKey: key)
                } else if value is JSONNull {
                        try container.encodeNil(forKey: key)
                } else if let value = value as? [Any] {
                        var container = container.nestedUnkeyedContainer(forKey: key)
                        try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                        var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                        try encode(to: &container, dictionary: value)
                } else {
                        throw encodingError(forValue: value, codingPath: container.codingPath)
                }
        }
}

static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
                try container.encode(value)
        } else if let value = value as? Int64 {
                try container.encode(value)
        } else if let value = value as? Double {
                try container.encode(value)
        } else if let value = value as? String {
                try container.encode(value)
        } else if value is JSONNull {
                try container.encodeNil()
        } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
        }
}

public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
                self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
                self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
                let container = try decoder.singleValueContainer()
                self.value = try JSONAny.decode(from: container)
        }
}

public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
                var container = encoder.unkeyedContainer()
                try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
                var container = encoder.container(keyedBy: JSONCodingKey.self)
                try JSONAny.encode(to: &container, dictionary: dict)
        } else {
                var container = encoder.singleValueContainer()
                try JSONAny.encode(to: &container, value: self.value)
        }
}
}
import Foundation
import Combine

class FetchProfileInfo: ObservableObject {
    @Published var basicInfo: BasicInfo

    init(basicInfo: BasicInfo) {
        self.basicInfo = basicInfo
    }

    func fetchRawStudentProfile(studentId: String, token: String, options: [String: Bool], completion: @escaping (Result<Welcome, Error>) -> Void) {
        var query = ""
        for (key, value) in options {
            if value {
                query += "\(key)=true&"
            }
        }
        query = String(query.dropLast())

        guard let url = URL(string: "https://dnevnik.mos.ru/core/api/student_profiles/\(studentId)?\(query)") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("auth_token=\(token); student_id=\(studentId);", forHTTPHeaderField: "Cookie")
        request.setValue(token, forHTTPHeaderField: "Auth-Token")
        request.setValue(studentId, forHTTPHeaderField: "Profile-Id")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Server error"])))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }

            do {
                let decoder = JSONDecoder()
                let studentProfile = try decoder.decode(Welcome.self, from: data)
                completion(.success(studentProfile))
            } catch {
                exit(0)
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
struct ProfileMin: Codable {
    let id: Int
    let type: String
}

func getProfileViaToken(token: String, completion: @escaping (Int?) -> Void) {
    let url = URL(string: "https://dnevnik.mos.ru/acl/api/users/profile_info")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("MOBILE", forHTTPHeaderField: "partner-source-id")
    request.setValue(token, forHTTPHeaderField: "Auth-Token")

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            completion(nil)
            return
        }

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            print("Error: Invalid response status code")
            completion(nil)
            return
        }

        guard let data = data else {
            print("Error: No data received")
            completion(nil)
            return
        }

        do {
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON: \(jsonString)")
            } else {
                print("Error: Unable to convert data to string")
            }

            let decoder = JSONDecoder()
            let profiles = try decoder.decode([ProfileMin].self, from: data)
            print("Decoded Profiles: \(profiles)")
            if let firstProfile = profiles.first {
                completion(firstProfile.id)
            } else {
                completion(nil)
            }
        } catch {
            print("Error: Failed to decode JSON: \(error.localizedDescription)")
            completion(nil)
        }
    }

    task.resume()
}
