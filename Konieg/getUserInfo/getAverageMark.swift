//
//  getAverageMark.swift
//  Konieg
//
//  Created by David I on 13.12.2024.
import Foundation
import SwiftUI


class AverageMark : ObservableObject{
    @Published var averageMarks: [(name: String, mark: Double)] = []
    @Published var error = ""
    
    
    public func fetchAverageMarks(studentId:String,token:String) {

        AcademicYears.getCurrentAcademicYear { academicYearId in
            guard let academicYearId = academicYearId else {
                DispatchQueue.main.async {
                   
                    self.error = "Failed to get academic year"
                }
                return
            }

            

                    let urlString = "https://dnevnik.mos.ru/reports/api/progress/json?academic_year_id=\(academicYearId)&student_profile_id=\(studentId)"
                    guard let url = URL(string: urlString) else {
                        DispatchQueue.main.async {
                    
                            self.error = "Invalid"
                        }
                        return
                    }

                    var request = URLRequest(url: url)
                    request.setValue("auth_token=\(token); student_id=\(studentId);", forHTTPHeaderField: "Cookie")
                    request.setValue(token, forHTTPHeaderField: "Auth-token")
                    request.setValue(studentId, forHTTPHeaderField: "Profile-Id")

                    let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        DispatchQueue.main.async {
                         
                        }

                        guard let data = data, error == nil else {
                            DispatchQueue.main.async {
                                self.error = "Failed to fetch data"
                            }
                            return
                        }

                        do {
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                                var result: [(name: String, mark: Double)] = []

                                for lesson in json {
                                    if let periods = lesson["periods"] as? [[String: Any]], !periods.isEmpty {
                                        let period = periods.last!
                                        var marks: [(mark: Int, weight: Int)] = []

                                        if let periodMarks = period["marks"] as? [[String: Any]] {
                                            for mark in periodMarks {
                                                if let values = mark["values"] as? [[String: Any]], let five = values.first?["five"] as? Int, let weight = mark["weight"] as? Int {
                                                    marks.append((mark: five, weight: weight))
                                                }
                                            }
                                        }

                                        if let subjectName = lesson["subject_name"] as? String {
                                            let averageMark = Utils.average(Utils.parseMarksWithWeight(marks))
                                            result.append((name: subjectName, mark: averageMark))
                                        }
                                    }
                                }

                                DispatchQueue.main.async {
                                    self.averageMarks = result
                                }
                            } else {
                                DispatchQueue.main.async {
                                    self.error = "Failed to parse data"
                                }
                            }
                        } catch {
                            DispatchQueue.main.async {
                                self.error = "Failed to parse data"
                            }
                        }
                    }

                    task.resume()
                }
            }
        }


class Utils {
    static func average(_ marks: [(mark: Int, weight: Int)]) -> Double {
        // Предположим, что у нас есть метод для вычисления среднего значения оценок с весами
        let totalWeight = marks.reduce(0) { $0 + $1.weight }
        let weightedSum = marks.reduce(0) { $0 + $1.mark * $1.weight }
        return Double(weightedSum) / Double(totalWeight)
    }

    static func parseMarksWithWeight(_ marks: [(mark: Int, weight: Int)]) -> [(mark: Int, weight: Int)] {
        // Предположим, что у нас есть метод для парсинга оценок с весами
        return marks
    }
}
