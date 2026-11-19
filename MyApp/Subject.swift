//
//  Subject.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/27/26.
//

import Foundation
import SwiftData

@Observable
class Subject: Codable{
    //make multiple subjects, one for each subject
    //stores all of the different homeworks, for this subject
    var homework : [Homework] = []
    var subject : String
    //each row is one type of homework
    //var data : [String : Int] = [:]
    //dictionary that records the homework type and its index
    //var homeworkType: [String:Int] = ["English": 0, "Math": 1, "Science": 2, "Social science": 3, "Computer science": 4]
    init(subject: String) {
        self.subject = subject
    }
    
    enum CodingKeys: String, CodingKey{
        case homework = "_homework"
        case subject = "_subject"
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(homework, forKey: .homework)
        try container.encode(subject, forKey: .subject)
    }
    
    func analyzeRating(homeworkType: String) -> Double {
        var totalRating = 0.0
        for i in 0..<homework.count {
            if homework[i].homeworkType == homeworkType{
                totalRating += Double((homework[i].homeworkRating))
            }
        }
        if totalRating != 0.0{
            return totalRating / Double(homework.count)
        } else {
            return 0
        }
    }
    
    func analyzeDifficulty(homeworkType: String) -> Double {
        var totalDifficulty = 0.0
        for i in 0..<homework.count {
            if homework[i].homeworkType == homeworkType{
                totalDifficulty += Double((homework[i].homeworkDifficulty))
            }
        }
        if totalDifficulty != 0.0{
            return totalDifficulty / Double(homework.count)
        } else {
            return 0
        }
    }
    
    func analyzeTimeSpent(homeworkType: String) -> Double {
        var totalTimeSpent = 0.0
        for i in 0..<homework.count {
            if homework[i].homeworkType == homeworkType{
                totalTimeSpent += Double((homework[i].timeSpent))
            }
        }
        if totalTimeSpent != 0.0{
            return totalTimeSpent / Double(homework.count)
        } else {
            return 0
        }
    }
    
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.homework = try container.decode([Homework].self, forKey: .homework)
        self.subject = try container.decode(String.self, forKey: .subject)
    }
}
