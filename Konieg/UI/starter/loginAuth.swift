//
//  loginAuth.swift
//  Konieg
//
//  Created by David I on 19.12.2024.
//

import SwiftUI

struct loginAuth: View {
    @State private var animation = false
    @StateObject var basicInfo: BasicInfo
    @State var wantleave = false
    @StateObject  var webViewModel: WebViewModel
    let UDM = UserDefaultsManager()
    var body: some View {
       
        
        if basicInfo.authLogin{
            VStack{
                VisualEffectView()
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .frame(width: CGFloat(Int(resX)) / 1.5, height: CGFloat(Int(resY)) / 15)
                    .overlay(
                        ZStack(alignment: .leading) {
                            if basicInfo.Login.isEmpty {
                                Text("Введите логин")
                                    .foregroundColor(.white)
                                    .opacity(0.6)
                                    .padding(.leading, 10)
                                    .font(.system(size: 16))
                            }
                            TextField("", text: $basicInfo.Login)
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                                .font(.system(size: 16))
                                .background(Color.clear)
                                .onChange(of: basicInfo.Login) { newValue in
                                    
                                    let allowedCharacters = CharacterSet.alphanumerics.union(.punctuationCharacters).union(.symbols)
                                    let filteredText = newValue.filter { allowedCharacters.contains($0.unicodeScalars.first!) }
                                    basicInfo.Login = filteredText
                                    
                                }
                            
                        }
                            .padding()
                    )
            
                
                
                VisualEffectView()
                           .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                           .frame(width: CGFloat(Int(resX)) / 1.5, height: CGFloat(Int(resY)) / 15)
                           .overlay(
                               ZStack(alignment: .leading) {
                                   if basicInfo.Password.isEmpty {
                                       Text("Введите пароль")
                                           .foregroundColor(.white)
                                           .opacity(0.6)
                                           .padding(.leading, 10)
                                           .font(.system(size: 16))
                                   }
                                   SecureField("", text: $basicInfo.Password)
                                       .foregroundColor(.white)
                                       .padding(.leading, 10)
                                       .font(.system(size: 16))
                                       .background(Color.clear)
                                       .onChange(of: basicInfo.Password) { newValue in
                                           let allowedCharacters = CharacterSet.alphanumerics.union(.punctuationCharacters).union(.symbols)
                                           let filteredText = newValue.filter { allowedCharacters.contains($0.unicodeScalars.first!) }
                                           basicInfo.Password = filteredText
                                         
                                       }
                               }
                               
                               .padding()
                           )
                
                
                
                Button(action:{
                    tapticEngine(energy: 0.8)
                    withAnimation{
                        print("\(basicInfo.TOKEN) and \(basicInfo.ProfileID)")
                        basicInfo.Loading = true
                       
                    }
                  
                   
                }){
                    VisualEffectView()
                        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .frame(width: CGFloat(Int(resX)) / 1.5, height: CGFloat(Int(resY)) / 15)
                        .overlay(
                            
                            Text("Войти")
                                .font(.system(size:resX/22 , weight: .semibold,design: .rounded))
                                .foregroundColor(.white)
                        )
                }
               
            }
            .ignoresSafeArea(.keyboard)
            
            VStack{
                Spacer()
                Button(action:{
                    tapticEngine(energy: 0.8)
                    withAnimation{
                        basicInfo.authLogin = false
                    }
                    
                }){
                    VisualEffectView()
                        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .frame(width: CGFloat(resX) / 2, height: CGFloat(resY) / 18)
                        .overlay(
                            Text("назад")
                                .font(.system(size:resX/28 , weight: .semibold,design: .rounded))
                                .foregroundColor(.white.opacity(basicInfo.Loading ? 0.5 : 1))
                        )
                        
                }
                .disabled(basicInfo.Loading)
            }
            .ignoresSafeArea(.keyboard)
            
            
         
        }
    }
            
                    
                    
                
                
            
            
            
                
        
        
    }


