//
//  ContentView.swift
//  Konieg
//
//  Created by David I on 12.12.2024.
//
import SwiftUI
import WebKit
import UIKit

struct ContentView: View {
    @StateObject var webViewModel: WebViewModel
    @State var masi = false
    @State private var resY = 0.0
    @State var majestic = false
    @StateObject  var basicInfo: BasicInfo
    @StateObject var massiveInfo: MassiveInfo
    let UDM = UserDefaultsManager()
    @StateObject var userTheme : UserTheme
    init() {
        let initialBasicInfo = BasicInfo() 
        let webViewModel = WebViewModel(basicInfo: initialBasicInfo)
        _webViewModel = StateObject(wrappedValue: webViewModel)
        _basicInfo = StateObject(wrappedValue: initialBasicInfo)
        _massiveInfo = StateObject(wrappedValue: MassiveInfo(basicInfo: initialBasicInfo))
        let initusertheme = UserTheme()
        _userTheme = StateObject(wrappedValue: initusertheme)
    }


    var body: some View {
        ZStack{
            LinearGradient(colors: [userTheme.theme.opacity(0.6), .clear, userTheme.theme.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            Image("Planet")
                .scaleEffect(1)
            
            LinearGradient(colors: [.clear.opacity(0.7), .black.opacity(0.3), .clear.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .overlay (
                    WebView(webView: webViewModel.webView)
                        .frame(width: 1, height: 1)
                        .onAppear {
                            webViewModel.loadInitialPage()
                        }
                        .offset(x: 100000000, y: 10000000)
                )
            VStack{
                if UDM.getBool(key:"successAuth") ?? false {
                    VStack{
                        switch userTheme.currentPage {
                        case 0:
                            DiaryView(webViewModel: webViewModel, basicInfo: basicInfo, massiveInfo: massiveInfo, userTheme: userTheme)
                        case 1:
                            
                            HomeWorkView(webViewModel: webViewModel, basicInfo: basicInfo, massiveInfo: massiveInfo, userTheme: userTheme)
                            
                            Text("error :0 \(basicInfo.error)")
                        case 2:
                            MarksView()
                        case 3:
                            ProfileView()
                        case 4:
                            SettingsView()
                        default:
                            Text("error :0 \(basicInfo.error)")
                        }
                    }
                    VStack{
                        Spacer()
                        TabBar(userTheme: userTheme)
                        if hasHomeButton(){
                            Text("")
                                .padding(resX/50)
                        }
                        
                    }
                    
                } else{
                    startMain(webViewModel: webViewModel, basicInfo: basicInfo, massiveInfo: massiveInfo, userTheme: userTheme)
               
                   
                    
                }
            }
            
            
            
            
            
            
        }
        
        
        
        
        
    }
}
    
    






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
