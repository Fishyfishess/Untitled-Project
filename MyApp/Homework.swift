//
//  Homework.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/27/26.
//

import Foundation

@Observable
class Homework: Codable{
    
    //each one can store one homework
    //save these into subject
    var homeworkType: String
    var homeworkName: String
    var homeworkRating : Int
    var homeworkDifficulty : Int
    var subject: String
    var dueDate: Date
    var timeSpent: Int
    var uid = UUID()
    init(homeworkType: String, homeworkName: String, homeworkRating: Int, homeworkDifficulty: Int, subject: String, dueDate: Date, timeSpent: Int, uid: UUID = UUID()) {
        self.homeworkType = homeworkType
        self.homeworkName = homeworkName
        self.homeworkRating = homeworkRating
        self.homeworkDifficulty = homeworkDifficulty
        self.subject = subject
        self.dueDate = dueDate
        self.timeSpent = timeSpent
        self.uid = uid
    }
    
    enum CodingKeys: String, CodingKey{
        case homeworkType = "_homeworkType"
        case homeworkName = "_homeworkName"
        case homeworkRating = "_homeworkRating"
        case homeworkDifficulty = "_homeworkDifficulty"
        case subject = "_subject"
        case dueDate = "_dueDate"
        case timeSpent = "_timeSpent"
        case uid = "_"
    }
    
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(homeworkType, forKey: .homeworkType)
        try container.encode(homeworkRating, forKey: .homeworkRating)
        try container.encode(homeworkDifficulty, forKey: .homeworkDifficulty)
        try container.encode(dueDate, forKey: .dueDate)
        try container.encode(timeSpent, forKey: .timeSpent)
        try container.encode(subject, forKey: .subject)
        try container.encode(uid, forKey: .uid)
    }
    
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.homeworkType = try container.decode(String.self, forKey: .homeworkType)
        self.homeworkName = try container.decode(String.self, forKey: .homeworkName)
        self.homeworkRating = try container.decode(Int.self, forKey: .homeworkRating)
        self.homeworkDifficulty = try container.decode(Int.self, forKey: .homeworkDifficulty)
        self.subject = try container.decode(String.self, forKey: .subject)
        self.dueDate = try container.decode(Date.self, forKey: .dueDate)
        self.timeSpent = try container.decode(Int.self, forKey: .timeSpent)
        self.uid = try container.decode(UUID.self, forKey: .uid)
    }
}
