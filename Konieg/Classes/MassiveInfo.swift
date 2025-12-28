//
//  MassiveInfo.swift
//  Konieg
//
//  Created by David I on 19.12.2024.
//
import Foundation
import Combine

class MassiveInfo: ObservableObject {
    @Published var basicInfo: BasicInfo
    @Published var rawData: Welcome?
    @Published var getprofileinfo: FetchProfileInfo
    init(basicInfo: BasicInfo) {
        let sigmaInfo = FetchProfileInfo(basicInfo: basicInfo)
        self.basicInfo = basicInfo
        self.getprofileinfo = sigmaInfo
        self.rawData = nil
    }

    func getALLInfo(with_groups: Bool , with_parents: Bool , with_assignment: Bool , with_ec_attendances:Bool,with_ae_attendances: Bool,with_home_based_periods: Bool,with_lesson_comments: Bool , with_attendances: Bool,with_final_marks:Bool, with_marks:Bool,with_subjects:Bool,with_lesson_info:Bool) {
        let options: [String: Bool] = [
            "with_groups": with_groups,
            "with_parents": with_parents,
            "with_assignments": with_assignment,
            "with_ec_attendances": with_ec_attendances,
            "with_ae_attendances": with_ae_attendances,
            "with_home_based_periods": with_home_based_periods,
            "with_lesson_comments":with_lesson_comments ,
            "with_attendances": with_attendances,
            "with_final_marks": with_final_marks,
            "with_marks": with_marks,
            "with_subjects": with_subjects,
            "with_lesson_info": with_lesson_info
        ]

        getprofileinfo.fetchRawStudentProfile(studentId: String(basicInfo.ProfileID), token: basicInfo.TOKEN, options: options) { result in
            switch result {
            case .success(let studentProfile):
                DispatchQueue.main.async {
                    self.rawData = studentProfile
                    print("Raw data received: \(studentProfile)")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
