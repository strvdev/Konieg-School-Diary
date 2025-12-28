//
//  BasicInfo.swift
//  Konieg
//
//  Created by David I on 19.12.2024.
//

import Foundation
import Combine
import UIKit
class BasicInfo: ObservableObject {
    let UDM = UserDefaultsManager()
    @Published var TOKEN: String
    @Published var ProfileID: Int
    @Published var authLogin: Bool
    @Published var Login: String
    @Published var Password: String
    @Published var Loading: Bool
    @Published var error: String
    @Published var succesAuth: Bool
    @Published var authLoginViaUrl: Bool
    init() {
        self.TOKEN = UDM.getString(key: "TOKEN") ?? ""
        self.ProfileID = UDM.getInteger(key: "ProfileID") ?? 0
        self.authLogin = false
        self.authLoginViaUrl = false
        self.Login = ""
        self.Password = ""
        self.Loading = false
        self.error = "all is ok"
        self.succesAuth = false
       
    }
}
public var resX: CGFloat {
    return UIScreen.main.bounds.width
}

// Screen height.
public var resY: CGFloat {
    return UIScreen.main.bounds.height
}


