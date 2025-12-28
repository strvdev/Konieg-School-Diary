//
//  startHeader.swift
//  Konieg
//
//  Created by David I on 19.12.2024.
//

import SwiftUI

struct startHeader: View {

    
    @StateObject var basicInfo: BasicInfo
    @StateObject  var massiveInfo: MassiveInfo
    @State var finalProc = false
    @StateObject  var webViewModel: WebViewModel
    @State var AcademicYear = 0
    @State var valuePro:Float = 0
    let UDM = UserDefaultsManager()
    @State var currentMessage = "..."
    @StateObject var userTheme : UserTheme
    @State var presentPopUP = false

    
    var body: some View {
      
       
        
            VStack{
                
                VStack {
                    Button(action:{
                        tapticEngine(energy: 0.8)
                        withAnimation{
                            //      basicInfo.authLogin = true
                            basicInfo.authLoginViaUrl = true
                        }
                    }){
                        VisualEffectView()
                            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                            .frame(width: resX / 1.5, height: resY / 15)
                            .overlay(
                                Text("Логин")
                                    .font(.system(size:resX/20 , weight: .semibold,design: .rounded))
                                    .foregroundColor(.white)
                            )
                    }
                    .sheet(isPresented: $basicInfo.authLoginViaUrl) {
                        ZStack{
                          
                            VStack{
                            WebView(webView: webViewModel.webView)
                                .edgesIgnoringSafeArea(.all)
                               
                                }
                            VStack{
                                Text("")
                                   
                                HStack{
                                    
                                    Rectangle()
                                        .frame(width: resX / 8, height:resX/70)
                                        .cornerRadius(15)
                                        .foregroundColor(.black)
                                        .opacity(0.75)
                                  
                                }
                                Spacer()
                            }
                        }
                        .onAppear {
                            webViewModel.loadInitialPage()
                        }
                            }
                
                    Button(action:{
                        tapticEngine(energy:0.9)
                        getProfileViaToken(token: basicInfo.TOKEN){ abso in
                            basicInfo.ProfileID = abso ?? 909
                            print(basicInfo.ProfileID)
                        }
                    }){
                        VisualEffectView()
                            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                            .frame(width: resX / 1.5, height: resY / 15)
                            .overlay(
                                Text("Токен")
                                    .font(.system(size:resX/20 , weight: .semibold,design: .rounded))
                                    .foregroundColor(.white)
                            )
                    }
                    .onChange(of: basicInfo.ProfileID){ fps in
                        
                        if basicInfo.TOKEN != "" && basicInfo.ProfileID != 0{
                            withAnimation{
                                UDM.saveBool(key: "isAuth", value: true)
                                UDM.saveString(key: "TOKEN", value: basicInfo.TOKEN)
                                UDM.saveInteger(key: "ProfileID", value: basicInfo.ProfileID)
                                UDM.synchronize()
                                
                                basicInfo.Loading = false
                            }
                         
                        }
                    }
                 
                    
                }
                .onChange(of: basicInfo.TOKEN){ sigma in
                    withAnimation{
                        basicInfo.authLoginViaUrl = false
                        finalProc = true
                        print(basicInfo.TOKEN)
                    }
                    
                }
                
                
                
                
                
                
            }
            .ignoresSafeArea(.keyboard)
        
    VStack{
      
       
        if finalProc{
            
            VisualEffectView()
                .frame(width:resX/1.3,height: resY/6)
                .cornerRadius(15.0)
                .overlay{
                    
                    ProgressView(value: valuePro, label: { Text(currentMessage).foregroundColor(.primary).bold() }, currentValueLabel: { Text("\(Int(valuePro*100))%") })
                        .progressViewStyle(BarProgressStyle(height: 35.0))
                    
                        .onAppear {
                            var kero = 0
                            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                                DispatchQueue.main.async {
                                    withAnimation(.bouncy(duration: 1.0)) {
                                        valuePro = min(max(valuePro + 0.05, 0), 1) // Ensure valuePro is within 0...1
                                        tapticEngine(energy: 0.1)
                                        kero += 1
                                        if kero == 6 {
                                            currentMessage = "Токен получен!"
                                            timer.invalidate()
                                            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                                                DispatchQueue.main.async {
                                                    currentMessage = "Получение ID пользователя..."
                                                    getProfileViaToken(token: basicInfo.TOKEN) { profileID in
                                                        DispatchQueue.main.async {
                                                            basicInfo.ProfileID = profileID ?? 909
                                                            if basicInfo.ProfileID != 909 {
                                                                var kerod = 0
                                                                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                                                                    DispatchQueue.main.async {
                                                                        withAnimation(.bouncy(duration: 1.0)) {
                                                                            valuePro = min(max(valuePro + 0.05, 0), 1) // Ensure valuePro is within 0...1
                                                                            tapticEngine(energy: 0.4)
                                                                            kerod += 1
                                                                            if kerod == 8 {
                                                                                currentMessage = "Получение данных пользователя..."
                                                                                timer.invalidate()
                                                                                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
                                                                                    DispatchQueue.main.async {
                                                                                        currentMessage = "ID пользователя получен!"
                                                                                        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                                                                                            DispatchQueue.main.async {
                                                                                                withAnimation(.bouncy(duration: 1.0)){
                                                                                                    valuePro = min(max(valuePro + 0.05, 0), 1) // Ensure valuePro is within 0...1
                                                                                                    tapticEngine(energy: 0.4)
                                                                                                    kerod += 1
                                                                                                    if kerod == 14 {
                                                                                                        basicInfo.succesAuth = true
                                                                                                        UDM.saveBool(key: "successAuth", value: true)
                                                                                                        currentMessage = "Данные пользователя получены!"
                                                                                                        
                                                                                                        timer.invalidate()
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }




                }
        
        }
    }
        
        
        
        
        
        
        
        
    
    }
    }



