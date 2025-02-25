// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let heightCM: Int?
    let email: String?
    let gdprAcceptedDateTime: String?
    let userLevel, firstName: String?
    let isReceiveNewsLetters: Bool?
    let receiveNewsLettersGlobalTime: String?
    let gender: Int?
    let initials: String?
    let isDoubleOptInNewsletter, heightInch, heightFeet: Int?
    let dob: String?
    let isGDPRAccepted: Int?
    let culture, lastName, gdprAcceptedPlatform, emailSalt: String?
    let userID1: Int?
    let encryptedPassword, salt: String?
    let isEmailVerified: Bool?
    let createdDate, globalTime: String?
    let isRegistrationCompleted: Bool?
    let failedPasswordAttemptCount: Int?
    let isLockedOut: Bool?
    let lastLockoutDate, lastPasswordChangedDate: String?
    let doubleOptInDateTime, updatedDate: String?
    let isValidUser, sendMaxFailedPasswordAttemptEmail, isOldUser, isEmailAddressExists: Bool?
    let userAccessToken: String?
    let settings: Settings?
    let aspnetUserID, source: String?
    let userID: Int?
    let userStatusCode: String?
    let activitySensorSettings: ActivitySensorSettings?
    let deviceClassDurationSetting: [DeviceClassDurationSetting]?
    let glucoseSettings: GlucoseSettings?
    let deviceClassConfiguration: DeviceClassConfiguration?
    let temperatureSettings: TemperatureSettings?
    let waterSettings: WaterSettings?
    let newsletterStatus: Int?
    let allRoles: [String]?
    let role, finalIdentifier, deviceID: String?

    enum CodingKeys: String, CodingKey {
        case heightCM = "HeightCm"
        case email = "Email"
        case gdprAcceptedDateTime = "GDPRAcceptedDateTime"
        case userLevel = "UserLevel"
        case firstName = "FirstName"
        case isReceiveNewsLetters = "IsReceiveNewsLetters"
        case receiveNewsLettersGlobalTime = "ReceiveNewsLettersGlobalTime"
        case gender = "Gender"
        case initials = "Initials"
        case isDoubleOptInNewsletter
        case heightInch = "HeightInch"
        case heightFeet = "HeightFeet"
        case dob = "DOB"
        case isGDPRAccepted = "IsGDPRAccepted"
        case culture
        case lastName = "LastName"
        case gdprAcceptedPlatform = "GDPRAcceptedPlatform"
        case emailSalt = "EmailSalt"
        case userID1 = "UserID1"
        case encryptedPassword = "EncryptedPassword"
        case salt
        case isEmailVerified = "IsEmailVerified"
        case createdDate = "CreatedDate"
        case globalTime = "GlobalTime"
        case isRegistrationCompleted = "IsRegistrationCompleted"
        case failedPasswordAttemptCount = "FailedPasswordAttemptCount"
        case isLockedOut = "IsLockedOut"
        case lastLockoutDate = "LastLockoutDate"
        case lastPasswordChangedDate = "LastPasswordChangedDate"
        case doubleOptInDateTime = "DoubleOptInDateTime"
        case updatedDate = "UpdatedDate"
        case isValidUser = "IsValidUser"
        case sendMaxFailedPasswordAttemptEmail
        case isOldUser = "IsOldUser"
        case isEmailAddressExists = "IsEmailAddressExists"
        case userAccessToken = "UserAccessToken"
        case settings = "Settings"
        case aspnetUserID = "AspnetUserId"
        case source = "Source"
        case userID = "UserId"
        case userStatusCode
        case activitySensorSettings = "ActivitySensorSettings"
        case deviceClassDurationSetting = "DeviceClassDurationSetting"
        case glucoseSettings = "GlucoseSettings"
        case deviceClassConfiguration = "DeviceClassConfiguration"
        case temperatureSettings = "TemperatureSettings"
        case waterSettings = "WaterSettings"
        case newsletterStatus = "NewsletterStatus"
        case allRoles = "AllRoles"
        case role = "Role"
        case finalIdentifier = "FinalIdentifier"
        case deviceID = "DeviceId"
    }
}

// MARK: - ActivitySensorSettings
struct ActivitySensorSettings: Codable {
    let weightKg, strideWalkFt, strideWalkInch, strideWalkCM: Int?
    let strideRunFt, strideRunInch, strideRunCM, goalSteps: Int?
    let goalUnit, goalSleep: Int?
    let alarmStatus: Bool?
    let alarmHour, alarmMinute: Int?
    let over100PctGoal: Bool?
    let calorieBurnedPerStep, calorieGoal: Int?
    let weightPound: Double?
    let bmr: Int?
    let createdDate: String?
    let isDeleted: Bool?
    let globalTime: String?
    let keyIdentifier, source: String?

    enum CodingKeys: String, CodingKey {
        case weightKg = "WeightKg"
        case strideWalkFt = "StrideWalkFt"
        case strideWalkInch = "StrideWalkInch"
        case strideWalkCM = "StrideWalkCM"
        case strideRunFt = "StrideRunFt"
        case strideRunInch = "StrideRunInch"
        case strideRunCM = "StrideRunCM"
        case goalSteps = "GoalSteps"
        case goalUnit = "GoalUnit"
        case goalSleep = "GoalSleep"
        case alarmStatus = "AlarmStatus"
        case alarmHour = "AlarmHour"
        case alarmMinute = "AlarmMinute"
        case over100PctGoal = "Over100PctGoal"
        case calorieBurnedPerStep = "CalorieBurnedPerStep"
        case calorieGoal = "CalorieGoal"
        case weightPound = "WeightPound"
        case bmr = "BMR"
        case createdDate = "CreatedDate"
        case isDeleted = "IsDeleted"
        case globalTime = "GlobalTime"
        case keyIdentifier = "KeyIdentifier"
        case source = "Source"
    }
}

// MARK: - DeviceClassConfiguration
struct DeviceClassConfiguration: Codable {
    let createdDate, globalTime: String?
    let counter, isDeleted: Int?
    let deviceClassJSON, source: String?

    enum CodingKeys: String, CodingKey {
        case createdDate = "CreatedDate"
        case globalTime = "GlobalTime"
        case counter = "Counter"
        case isDeleted = "IsDeleted"
        case deviceClassJSON = "DeviceClassJSON"
        case source = "Source"
    }
}

// MARK: - DeviceClassDurationSetting
struct DeviceClassDurationSetting: Codable {
    let deviceClassID: Int?
    let duration, startTime, endTime: String?
    let deviceClassDurationSettingID, counter: Int?
    let createdDate: String?
    let isDeleted: Bool?
    let globalTime: String?
    let userID3, recordIdentifier, source, keyIdentifier: String?
    let userID: Int?
    let startTimeHour, startTimeMinute, startTimeSecond, endTimeHour: String?
    let endTimeMinute, endTimeSecond: String?

    enum CodingKeys: String, CodingKey {
        case deviceClassID = "DeviceClassId"
        case duration = "Duration"
        case startTime = "StartTime"
        case endTime = "EndTime"
        case deviceClassDurationSettingID = "DeviceClassDurationSettingID"
        case counter = "Counter"
        case createdDate = "CreatedDate"
        case isDeleted = "IsDeleted"
        case globalTime = "GlobalTime"
        case userID3 = "UserID3"
        case recordIdentifier = "RecordIdentifier"
        case source = "Source"
        case keyIdentifier = "KeyIdentifier"
        case userID = "UserId"
        case startTimeHour = "StartTimeHour"
        case startTimeMinute = "StartTimeMinute"
        case startTimeSecond = "StartTimeSecond"
        case endTimeHour = "EndTimeHour"
        case endTimeMinute = "EndTimeMinute"
        case endTimeSecond = "EndTimeSecond"
    }
}

// MARK: - GlucoseSettings
struct GlucoseSettings: Codable {
    let displayUnit: String?
    let targetStartValueMgdl, targetEndValueMgdl, targetStartValueMmol: Int?
    let targetEndValueMmol: Double?
    let createdDate: String?
    let isDeleted: Bool?
    let globalTime: String?
    let recordIdentifier, keyIdentifier, source: String?

    enum CodingKeys: String, CodingKey {
        case displayUnit = "DisplayUnit"
        case targetStartValueMgdl = "TargetStartValue_mgdl"
        case targetEndValueMgdl = "TargetEndValue_mgdl"
        case targetStartValueMmol = "TargetStartValue_mmol"
        case targetEndValueMmol = "TargetEndValue_mmol"
        case createdDate = "CreatedDate"
        case isDeleted = "IsDeleted"
        case globalTime = "GlobalTime"
        case recordIdentifier = "RecordIdentifier"
        case keyIdentifier = "KeyIdentifier"
        case source = "Source"
    }
}

// MARK: - Settings
struct Settings: Codable {
    let dateFormat, timeFormat, metricFormat, language: String?
    let userID3, recordIdentifier: String?
    let globalTime, updatedDate: String?
    let isDeleted, updateCheck: Bool?
    let firstDayOfWeek, counter: Int?
    let source: String?

    enum CodingKeys: String, CodingKey {
        case dateFormat = "DateFormat"
        case timeFormat = "TimeFormat"
        case metricFormat = "MetricFormat"
        case language = "Language"
        case userID3 = "UserID3"
        case recordIdentifier = "RecordIdentifier"
        case globalTime = "GlobalTime"
        case updatedDate = "UpdatedDate"
        case isDeleted = "IsDeleted"
        case updateCheck = "UpdateCheck"
        case firstDayOfWeek = "FirstDayOfWeek"
        case counter = "Counter"
        case source = "Source"
    }
}

// MARK: - TemperatureSettings
struct TemperatureSettings: Codable {
    let createdDate, globalTime: String?
    let isDeleted: Bool?
    let recordIdentifier, source: String?
    let counter, temperatureUnit: Int?

    enum CodingKeys: String, CodingKey {
        case createdDate = "CreatedDate"
        case globalTime = "GlobalTime"
        case isDeleted = "IsDeleted"
        case recordIdentifier = "RecordIdentifier"
        case source = "Source"
        case counter = "Counter"
        case temperatureUnit = "TemperatureUnit"
    }
}

// MARK: - WaterSettings
struct WaterSettings: Codable {
    let createdDate, globalTime: String?
    let isDeleted: Int?
    let userID3, recordIdentifier, source: String?
    let counter, waterUnit: Int?
    let keyIdentifier: String?

    enum CodingKeys: String, CodingKey {
        case createdDate = "CreatedDate"
        case globalTime = "GlobalTime"
        case isDeleted = "IsDeleted"
        case userID3 = "UserID3"
        case recordIdentifier = "RecordIdentifier"
        case source = "Source"
        case counter = "Counter"
        case waterUnit = "WaterUnit"
        case keyIdentifier = "KeyIdentifier"
    }
}
