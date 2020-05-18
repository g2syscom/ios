//
//  BoardView.swift
//  SmartGW
//
//  Created by Daniel Roh on 2020/03/30.
//  Copyright © 2020 G2. All rights reserved.


//  Slide menu UI, quite different from Android version.  

import SwiftUI

struct BoardView: View {
    

        
    
    @State var index = "쪽지함"
    @State var show = false
    var body: some View {
        ZStack {
            
            (self.show ? Color.black.opacity(0.8) : Color.clear).edgesIgnoringSafeArea(.top)
            (self.show ? Color.black.opacity(0.8) : Color.white).edgesIgnoringSafeArea(.bottom)
            
            ZStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 25) {
                    
                    HStack {
                    
                        Image(systemName: "person.circle.fill").resizable().frame(width: 65, height: 65).foregroundColor(Color.white)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Noah").fontWeight(.bold).foregroundColor(Color.white)
                            Text("Seoul , KOR").foregroundColor(Color.white)
                        }
                    }.padding(.bottom, 50)
                    
                    
                    
                    ForEach(data,id: \.self) {i in
                        
                        Button(action: {
                            
                            self.index = i
                            
                            withAnimation(.spring()) {
                                self.show.toggle()
                            }
                            
                        }) {
                            HStack {
                                Capsule().fill(self.index == i ? Color.white : Color.clear).frame(width: 5, height: 30)
                                
                                Text(i).padding(.leading).foregroundColor(.white)
                            }
                        }
                    }
                    
                    Spacer()
                }.padding(.leading).padding(.top).scaleEffect(self.show ? 1 : 0)
                
                ZStack(alignment: .topTrailing) {
                    
                    BoardMainView(show: self.$show,index: self.$index).scaleEffect(self.show ? 0.8: 1).offset(x: self.show ? 150 : 0, y: self.show ? 50: 0).disabled(self.show ? true : false)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            self.show.toggle()
                        }
                        
                    }) {
                        Image(systemName: "xmark").resizable().frame(width: 15, height: 15).foregroundColor(.white)
                    }.padding().opacity(self.show ? 1 : 0)
                }
            }
            }.navigationBarTitle("board")
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}

struct BoardMainView: View {
    
    @Binding var show: Bool
    @Binding var index: String
    
    var body: some View {
        
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            self.show.toggle()
                        }
                        
                    }) {
                        Image("logo2").resizable().frame(width: 50, height: 30)
                        
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image("").resizable().frame(width: 20, height: 18)
                        
                    }
                }.buttonStyle(PlainButtonStyle())
                
                Text(self.index == "배송리스트" ? "배송리스트" : self.index == "AS할당리스트" ? "AS할당리스트" : self.index == "구매입고" ? "구매입고" : "SMART NOTES").fontWeight(.bold).font(.title).foregroundColor(Color.white)
            }.padding(.horizontal).padding(.vertical, 10).background(Color.black)
            
            ZStack {
                
                BoardChat().opacity(self.index == "배송리스트" ? 1 : 0)
                BoardFriendList().opacity(self.index == "AS할당리스트" ? 1 : 0)
                BoardSettings().opacity(self.index == "구매입고" ? 1 : 0)
            }
        }.background(Color.white).cornerRadius(0)
    }
}

struct BoardChat: View {
    
    var body: some View {
        SmartNotesView()
        
    }
}

struct BoardFriendList: View {
    
    var body: some View {
        
        GeometryReader {_ in
            
            VStack {
                Text("AS할당리스트 데이터 예정")
            }
        }
    }
}

struct BoardSettings: View {
    
    var body: some View {
        
        GeometryReader {_ in
            
            VStack {
                Text("구매입고 데이터 예정")
            }
        }
    }
}


var data = ["배송리스트", "AS할당리스트", "구매입고"]
