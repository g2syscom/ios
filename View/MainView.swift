//
//  MainView.swift
//  SmartGW
//
//  Created by Daniel Roh on 2020/03/29.
//  Copyright © 2020 G2. All rights reserved.

//  Main Menu

import SwiftUI

struct MainView: View {
    
    @State var index = 0
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(named: "Color1")!]
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().isOpaque = true
        
        
    }
    
    var body: some View {
        
        
        NavigationView{
            
            ZStack {
                Rectangle().foregroundColor(Color("1")).edgesIgnoringSafeArea(.all)
                GeometryReader { geometry in
                    
                    
                    VStack {
                        
                        NavigationLink(destination: BoardView()) {
                            
                            ZStack {
                                Rectangle().frame(width:geometry.size.width * 0.9, height: geometry.size.height * 0.25).foregroundColor(Color("2")).edgesIgnoringSafeArea(.all)
                                Image("logo_erp").resizable().frame(width: geometry.size.width * 0.85, height: geometry.size.width / 6)

                                
                            }

                                .navigationBarTitle(Text(""), displayMode: .inline)
                            }
                        .buttonStyle(PlainButtonStyle())
                        
                            HStack {
                                NavigationLink(destination: BoardView()) {
                                    ZStack{
                                        Rectangle().frame(width: geometry.size.width * 0.9 / 2 - 4.5, height: geometry.size.width * 0.9 / 2 - 4.5).foregroundColor(Color("2"))
                                        Image("icon_1_mail").resizable().frame(width: (geometry.size.width * 0.9 / 2 - 4.5) * 0.7, height: (geometry.size.width * 0.9 / 2 - 4.5) * 0.7).padding(0).background(Color(red: 0.18, green: 0.24, blue: 0.60)).foregroundColor(Color(red: 0.30, green: 0.53, blue: 0.82))
                                    }
                                    
                                    
                                }.buttonStyle(PlainButtonStyle())

                                NavigationLink(destination: MessageView()) {
                                    ZStack {
                                        Rectangle().frame(width: geometry.size.width * 0.9 / 2 - 4.5, height: geometry.size.width * 0.9 / 2 - 4.5).foregroundColor(Color("2"))
                                        Image("icon_2_tv").resizable().frame(width: (geometry.size.width * 0.9 / 2 - 4.5) * 0.7, height: (geometry.size.width * 0.9 / 2 - 4.5) * 0.7).padding(0).background(Color(red: 0.18, green: 0.24, blue: 0.60)).foregroundColor(Color(red: 0.30, green: 0.53, blue: 0.82))
                                    }
                                }.buttonStyle(PlainButtonStyle())
                                
                                
                            }
                        
                        
                        HStack {
                            ZStack {
                                Rectangle().frame(width: geometry.size.width * 0.9 / 2 - 4.5, height: geometry.size.width * 0.9 / 2 - 4.5).foregroundColor(Color("2"))
                                Image("icon_3_tempsnip").resizable().frame(width: (geometry.size.width * 0.9 / 2 - 4.5) * 0.7, height: (geometry.size.width * 0.9 / 2 - 4.5) * 0.7).padding(0).background(Color(red: 0.18, green: 0.24, blue: 0.60)).foregroundColor(Color(red: 0.30, green: 0.53, blue: 0.82))
                            }
                            NavigationLink(destination: MessageView()) {
                                ZStack {
                                    Rectangle().frame(width: geometry.size.width * 0.9 / 2 - 4.5, height: geometry.size.width * 0.9 / 2 - 4.5).foregroundColor(Color("2"))
                                    Image("icon_4_chat").resizable().frame(width: (geometry.size.width * 0.9 / 2 - 4.5) * 0.7, height: (geometry.size.width * 0.9 / 2 - 4.5) * 0.7).padding(0).background(Color(red: 0.18, green: 0.24, blue: 0.60)).foregroundColor(Color(red: 0.30, green: 0.53, blue: 0.82))
                                }
                            }.buttonStyle(PlainButtonStyle())
                            
                            
                        }
                        HStack {
                            ZStack {
                                Rectangle().frame(width: geometry.size.width * 0.9 / 3 - 6, height: geometry.size.width * 0.9 / 4 - 4.5).foregroundColor(Color("2"))
                                Image("icon_5_person").resizable().frame(width: 80, height: 55).padding(10).background(Color(red: 0.18, green: 0.24, blue: 0.60)).foregroundColor(Color(red: 0.30, green: 0.53, blue: 0.82))
                            }
                            ZStack {
                                Rectangle().frame(width: geometry.size.width * 0.9 / 3 - 6, height: geometry.size.width * 0.9 / 4 - 4.5).foregroundColor(Color("2"))
                                Image("icon_6_minichat").resizable().frame(width: 80, height: 55).padding(10).background(Color(red: 0.18, green: 0.24, blue: 0.60)).foregroundColor(Color(red: 0.30, green: 0.53, blue: 0.82))
                            }
                            NavigationLink(destination: UserInfo()) {
                            ZStack {
                                
                                    Rectangle().frame(width: geometry.size.width * 0.9 / 3 - 6, height: geometry.size.width * 0.9 / 4 - 4.5).foregroundColor(Color("2"))
                                    Image("icon_7_userinfo").resizable().frame(width: 80, height: 55).padding(10).background(Color(red: 0.18, green: 0.24, blue: 0.60)).foregroundColor(Color(red: 0.30, green: 0.53, blue: 0.82))
                                }
                                
                            }.buttonStyle(PlainButtonStyle())
                            
                        }
                        
                    }
                }
                
            }
        }
            
        
    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


