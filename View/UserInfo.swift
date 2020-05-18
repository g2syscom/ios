//
//  UserInfo.swift
//  SmartGroupWare
//
//  Created by Daniel Roh on 2020/05/18.
//  Copyright © 2020 G2. All rights reserved.


//  UserInfo Page, use observed object instead of string between "" to see json data
import SwiftUI

struct UserInfo: View {
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color("1")).edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(systemName: "person.fill").resizable().foregroundColor(Color(.white)).frame(width: 120, height: 120, alignment: .leading)
                Spacer().frame(height: 60)
                
                HStack {
                    Image(systemName: "person").foregroundColor(Color(.white))
                    Text("영업 1팀").foregroundColor(Color(.white))
                    
                }
                HStack {
                    Image(systemName: "person").foregroundColor(Color(.white))
                    Text("시스템관리자").foregroundColor(Color(.white))
                }
                HStack {
                    Image(systemName: "person").foregroundColor(Color(.white))
                    Text("010-2489-0000").foregroundColor(Color(.white))
                }
                HStack {
                    Image(systemName: "person").foregroundColor(Color(.white))
                    Text("mail.g2sysnet.com").foregroundColor(Color(.white))
                }
            }
        }
    }
}

struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo()
    }
}
