//
//  DiaryView.swift
//  Konieg
//
//  Created by David I on 20.12.2024.
//

import SwiftUI

struct DiaryView: View {
    @StateObject  var webViewModel: WebViewModel
    @StateObject  var basicInfo: BasicInfo
    @StateObject  var massiveInfo: MassiveInfo
    let UDM = UserDefaultsManager()
    @StateObject var userTheme : UserTheme
    @State var presentPopUP = false
 
    var body: some View {
        ZStack{
            
            VStack{
               Text("Дневник")
                    .font(.system(size: resX / 18, weight: .semibold, design: .rounded))
                    .onAppear{
                        print(UDM.getString(key: "TOKEN"))
                        
                    }
                Spacer()
               
              
            }
            
        }

    }
}

