//
//  TabBar.swift
//  Konieg
//
//  Created by David I on 19.12.2024.
//

import SwiftUI

struct TabBar: View {
    @StateObject var userTheme = UserTheme()
  
 
    @State var adr = [-resX/3.221,-resX/6,0,resX/6.3 , resX/3.27]
    @State private var imageOffset: CGPoint = .zero
    @State var icons = ["book.closed","checklist","graduationcap","person","gearshape"]
    var body: some View {
        ZStack{
            
            VStack{
                VisualEffectView()
                    .frame(width:resX / 1.15, height: resY/12)
                    .cornerRadius(70)
            }
            VStack{
                Rectangle()
                    .cornerRadius(100)
                    .frame(width: resX/7,height: resX/7)
                    .foregroundColor(.white)
                    .offset(x:CGFloat(adr[userTheme.currentPage]))
                
                    
            }
        VStack{
            
            HStack(spacing:resX/15){
                ForEach(0..<icons.count){ number in
                    
                    Button(action:{
                        withAnimation{
                            userTheme.currentPage = number
                            
                        }
                       
                    }){
                    
                            Image(systemName: icons[number])
                                .font(.system(size: resX / 15))
                                
                                
                        
                      
                        
                    }

                                
                    
                }
                
            }
            }
          
        }
    }
}


