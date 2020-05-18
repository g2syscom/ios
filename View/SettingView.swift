//
//  SettingView.swift
//  SmartGroupWare
//
//  Created by Daniel Roh on 2020/04/20.
//  Copyright © 2020 G2. All rights reserved.


//  Setting page: Company Code, ip address etc.

import SwiftUI
import Combine



struct SettingView: View {
    
    @State var selected = ""
    @State var show = false
    @ObservedObject var codeOne = SettingCodeOne()
    @ObservedObject var codeTwo = SettingCodeTwo()
    
    
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color.white).edgesIgnoringSafeArea(.all).background(Color.white)
            VStack(alignment:.leading, spacing: 10) {
                Text("디폴트 설정").font(.system(size: 17)).foregroundColor(.blue)
                Divider()
                Text("회사코드 설정").font(.system(size: 20)).foregroundColor(.black)
                TextField("회사코드를 설정합니다.", text: $codeOne.text)
                Divider()
                Text("IP설정").font(.system(size: 20)).foregroundColor(.black)
                TextField("회사 IP를 설정합니다.", text: $codeTwo.text).foregroundColor(Color.black)
                
                Button(action: {
                    self.show.toggle()
                }) {
                    Text("open").padding(.vertical).padding().padding(.horizontal, 25).foregroundColor(.white)
                    }.background(Color("1")).clipShape(Capsule())
                
                Text(self.selected).padding(.top)
            }
            VStack {
                Spacer()
                RadioButtons(selected: self.$selected, show: self.$show).offset(y: self.show ? (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 60 : UIScreen.main.bounds.height)
            }.background(Color(UIColor.label.withAlphaComponent(self.show ? 0.9 : 0)).edgesIgnoringSafeArea(.all)).padding(.vertical)
        }.background(Color("Color2")).edgesIgnoringSafeArea(.all).animation(.default)
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

struct RadioButtons: View {
    
    @Binding var selected: String
    @Binding var show: Bool
    @ObservedObject var codeOne = SettingCodeOne()
    @ObservedObject var codeTwo = SettingCodeTwo()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            Text("환경설정").font(.title).padding(.top)
            
            ForEach(companyData, id: \.self) { i in
                
                Button(action: {
                    
                    self.selected = i
                    
                }) {
                    HStack {
                        
                        Text(i)
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(self.selected == i ? Color("1") : Color.black.opacity(0.5)).frame(width: 18, height: 18)
                            
                            if self.selected == i {
                                
                                Circle().stroke(Color("1"), lineWidth: 4).frame(width: 18, height: 18)
                                
                            }
                        }
                        
                        
                    }.foregroundColor(.black)
                }.padding(.top)
            }
            
            
            
            ExDivider()
            Text("회사코드 설정").font(.system(size: 20)).foregroundColor(.black)
            TextField("회사코드를 설정합니다.", text: $codeOne.text)
            Divider()
            Text("IP설정").font(.system(size: 20)).foregroundColor(.black)
            TextField("회사 IP를 설정합니다.", text: $codeTwo.text)
            Divider()
            HStack {
                
                Spacer()
                
                Button(action: {
                    self.show.toggle()
                    UIApplication.shared.endEditing()
                }) {
                    Text("완료").padding(.vertical).padding(.horizontal,25).foregroundColor(Color.white)
                }
                .background(self.selected != "" ? Color("1") : Color("1").opacity(0.2)).clipShape(Capsule()).disabled(self.selected != "" ? false : true)
            }.padding(.top)
            
        }.padding(.vertical)
        .padding(.horizontal,50)
            .padding(.bottom,(UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 60)
            .background(Color.white)
        .cornerRadius(25)
        
    }
}




