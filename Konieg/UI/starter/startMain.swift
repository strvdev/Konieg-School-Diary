//
//  StartMain.swift
//  Konieg
//
//  Created by David I on 19.12.2024.
//

import SwiftUI
import WebKit
import PopupView
struct startMain: View {
    @StateObject  var webViewModel: WebViewModel
    @State var AcademicYear = 0
    @StateObject  var basicInfo: BasicInfo
    @StateObject var massiveInfo: MassiveInfo
    let UDM = UserDefaultsManager()
    @StateObject var userTheme : UserTheme
    @State var presentPopUP = false
  
    var body: some View {
        ZStack {
   
            
          
            
           
           
                
            
            
            
            
            VStack {
                Text("Plutonium")
                    .font(.system(size: resX / 12, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .onChange(of: userTheme.themePicker){ sigma in
                        presentPopUP = userTheme.themePicker
                    }
                Text("Неофициальный МЭШ клиент")
                    .font(.system(size: resX/28, weight: .light, design: .rounded))
                
                    .foregroundColor(.white)
                    .onAppear{
                        UDM.saveString(key: "ThemeColor", value: "#121111")
                    }
                Spacer()
            }
            VStack{
                
                Text("Вход")
                    .font(.system(size: resX / 14, weight: .semibold, design: .rounded))
                   
                    .foregroundColor(.white)
                Text("")
                    .padding(resY / 7)
            }
            
            if basicInfo.authLogin {
                withAnimation{
                    loginAuth(basicInfo: basicInfo,webViewModel:webViewModel)
                }
            } else {
                withAnimation{
                    startHeader(basicInfo: basicInfo, massiveInfo: massiveInfo, webViewModel: webViewModel, userTheme: userTheme)
                }
            }
            if !basicInfo.authLogin {
            VStack{
                Spacer()
               
                    Button(action:{
                        userTheme.themePicker = true
                        
                    }){
                        
                        Text("Цветовая тема")
                            .font(.system(size: resX / 25, weight: .light, design: .rounded))
                            .foregroundColor(.white)
                        Image(systemName: !basicInfo.authLogin ? "globe.americas" : "")
                            .font(.system(size:30,weight: .light, design: .rounded))
                            .foregroundColor(.white)
                       
                        
                    }
                    .buttonStyle(ScaleButtonStyle())
                    
                    
                    Text(!basicInfo.authLogin ? "Версия 1.3 beta" : "" )
                        .font(.system(size:resX / 25,weight: .light,design: .rounded))
                        .foregroundColor(.white)
                    
                }
                  
            }
            
            
            
            if basicInfo.Loading{
                LoadingView()
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }
           
            
            
        }
        .popup(isPresented: $presentPopUP) {
            VisualEffectView()
                .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
                .frame(width: .infinity, height: resY / 3)
                
                .overlay(
                    ZStack{
                        VStack{
                            Text("")
                              
                            Rectangle()
                                .frame(width: resX / 8, height:resX/70)
                                .cornerRadius(15)
                                .foregroundColor(.white)
                                .opacity(0.75)
                            Spacer()
                        }
                           
                        VStack{
                            Text("")
                                .padding(2)
                            Text("Поменять тему")
                                .font(.system(size:resX/18,weight: .semibold,design: .rounded))
                                .foregroundColor(.white)
                                
                            
                            Spacer()
                        }
                        VStack{
                            Text("")
                                .padding(2)
                            VisualEffectView()
                                .onDisappear{
                                    userTheme.themePicker = false
                                }
                                .clipShape(RoundedRectangle(cornerRadius: resX/7, style: .continuous))
                                .frame(width: resY/2.2, height: resY / 5)
                                .opacity(0.7)
                                .overlay(
                                    VStack{
                                        HStack(spacing: 7){
                                            Button(action:{
                                                userTheme.theme = Color(hex: "#121111")
                                                UDM.saveString(key: "ThemeColor", value: "#121111")
                                            }){
                                                Circle()
                                                    .foregroundColor(Color(hex: "#121111"))
                                                    .scaleEffect(0.7)
                                            }
                                            .buttonStyle(ScaleButtonStyle())
                                            Button(action:{
                                                userTheme.theme = Color(hex: "#0b1b6b")
                                                UDM.saveString(key: "ThemeColor", value: "#0b1b6b")
                                            }){
                                                Circle()
                                                    .foregroundColor(Color(hex: "#0b1b6b"))
                                                    .scaleEffect(0.7)
                                            }
                                            .buttonStyle(ScaleButtonStyle())
                                            Button(action:{
                                                userTheme.theme = Color(hex: "#cc64ad")
                                                UDM.saveString(key: "ThemeColor", value: "#cc64ad")
                                            }){
                                                Circle()
                                                    .scaleEffect(0.7)
                                                    .foregroundColor(Color(hex: "#cc64ad"))
                                            }
                                            .buttonStyle(ScaleButtonStyle())
                                        }
                                    }
                                        
                                        )
                                        
                                        
                                    }
                    }
                        
                )
                    } customize: {
                        $0
                                .type (.toast)
                                .position(.bottom)
                                .dragToDismiss(true)
                    }
      
        .ignoresSafeArea(.keyboard)
    }
    }
struct WebView: UIViewRepresentable {
    var webView: WKWebView

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

