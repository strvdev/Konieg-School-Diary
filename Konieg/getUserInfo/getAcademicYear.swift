//
//  getAcademicYear.swift
//  Konieg
//
//  Created by David I on 13.12.2024.
//
import Foundation

public struct AcademicYear: Codable {
    let id: Int
    let name: String
    var begin_date: String
    var end_date: String
    let calendar_id: Int
    let current_year: Bool
}

 class AcademicYears {
    static func getAcademicYears(completion: @escaping ([AcademicYear]?) -> Void) {
        let url = URL(string: "https://dnevnik.mos.ru/core/api/academic_years")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            do {
                let res = try JSONDecoder().decode([AcademicYear].self, from: data)
                completion(res)
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }

    static func getCurrentAcademicYear(completion: @escaping (Int?) -> Void) {
        getAcademicYears { res in
            guard let res = res else {
                completion(nil)
                return
            }
            for year in res {
                if year.current_year {
                    completion(year.id)
                    return
                }
            }
            completion(nil)
        }
    }
}
