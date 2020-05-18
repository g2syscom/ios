//
//  MessageView.swift
//  SmartGroupWare
//
//  Created by Daniel Roh on 2020/05/14.
//  Copyright © 2020 G2. All rights reserved.

//  Message page UI

import SwiftUI

struct MessageView: View {
    var body: some View {
        
            Home()
        
        
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

struct Home : View {
    
    @State var index = 0
    @State var show = false
    
    var body : some View{
        
        VStack(spacing: 0){
            Rectangle().frame(height: 40).foregroundColor(Color("1"))
            
            appBar(index: self.$index,show: self.$show)
            
            ZStack{
                
                Chats(show: self.$show).opacity(self.index == 0 ? 1 : 0)
                
                Status().opacity(self.index == 1 ? 1 : 0)
                
                Calls().opacity(self.index == 2 ? 1 : 0)
            }

            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct appBar : View {
    
    @Binding var index : Int
    @Binding var show : Bool
    
    var body : some View{
        
        VStack(spacing: 25){
            
//            if self.show{
//
//                HStack{
//
//                    Text("메세지함")
//                        .fontWeight(.bold)
//                        .font(.title)
//                        .foregroundColor(.white)
//
//                    Spacer(minLength: 0)
//
//                    Button(action: {
//
//                    }) {
//
//                        Image(systemName: "magnifyingglass")
//                        .resizable()
//                        .frame(width: 18, height: 18)
//                        .foregroundColor(.white)
//                    }
//
//                    Button(action: {
//
//                    }) {
//
//                        Image("logo")
//                        .resizable()
//                        .frame(width: 18, height: 18)
//                        .foregroundColor(.white)
//
//                    }.padding(.leading)
//                }
//            }
            
            HStack{
                
                Button(action: {
                    
                    self.index = 0
                    
                }) {
                    
                    VStack{
                        
                        Text("읽지않음")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 0 ? .bold : .none)
                        
                        Capsule().fill(self.index == 0 ? Color.white : Color.clear)
                        .frame(height: 4)
                    }
                }
                
                Button(action: {
                    
                    self.index = 1
                    
                }) {
                    
                    VStack{
                        
                        Text("받은쪽지")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 1 ? .bold : .none)
                        
                        Capsule().fill(self.index == 1 ? Color.white : Color.clear)
                        .frame(height: 4)
                    }
                }
                
                Button(action: {
                    
                    self.index = 2
                    
                }) {
                    
                    VStack{
                        
                        Text("보낸쪽지")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 2 ? .bold : .none)
                        
                        Capsule().fill(self.index == 2 ? Color.white : Color.clear)
                        .frame(height: 4)
                    }
                }
                
            }.padding(.bottom, 10)
            
            
        }.padding(.horizontal)
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10)
        .background(Color("1"))
    }
}

struct Chats : View {
    
    @Binding var show : Bool
    

    var body : some View{

        
        List(0...10,id: \.self){i in


            CellView()
        }
    }
    
}

struct CellView : View {
    
    var body : some View{
        
        HStack{
            
            Image(systemName: "person.circle.fill")
            .resizable()
                .frame(width: 30, height: 30).foregroundColor(Color("1"))
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("홍길동")
                
                Text("수주번호 230204240 건이 수주 완료되었습니다.").font(.caption)
            }
        }
        .padding(.vertical, 4)
    }
}



struct Status : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("받은쪽지가 없습니다.")
            }
        }
    }
}

struct Calls : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("보낸쪽지가 없습니다.")
            }
        }
    }
}

class Host : UIHostingController<MessageView>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
}



// ---------

//import SwiftUI
//
// struct MessageView: View {
//     var body: some View {
//
//         Home()
//     }
// }
//
// struct MessageView_Previews: PreviewProvider {
//     static var previews: some View {
//         MessageView()
//     }
// }
//
//
// struct Home : View {
//
//     @State var index = 0
//
//     var body : some View{
//
//         VStack(spacing: 0){
//
//             MMainView(index: self.$index)
//
//             TabBar(index: self.$index)
//         }
//         .edgesIgnoringSafeArea(.top)
//     }
// }
//
// struct MMainView : View {
//
//     @Binding var index : Int
//
//     var body : some View{
//
//         GeometryReader{_ in
//
//             VStack{
//
//                 //Your Views Change Views By Index....
//
//                 Text("")
//             }
//             .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
//         }
//         .background(Color("1").edgesIgnoringSafeArea(.top))
////         .clipShape(Corners())
//     }
// }
//
// struct TabBar : View {
//
//     @Binding var index : Int
//
//     var body : some View{
//
//         HStack{
//
//            HStack(spacing: (UIScreen.main.bounds.width) / 6){
//
//                 Button(action: {
//
//                     self.index = 0
//
//                 }) {
//
////                     Image(systemName: "house.fill")
//
//                    Text("읽지않음").fontWeight(.light).font(.system(size: 16))
//
//                         .foregroundColor(self.index == 0 ? .black : Color.black.opacity(0.35))
//
//                 }
//
//                 Button(action: {
//
//                     self.index = 1
//
//                 }) {
//
//                     Text("받은쪽지").fontWeight(.light).font(.headline)
//                         .foregroundColor(self.index == 1 ? .black : Color.black.opacity(0.35))
//                 }
//
//                 Button(action: {
//
//                     self.index = 2
//
//                 }) {
//
//                     Text("보낸쪽지").fontWeight(.light).font(.headline)
//                         .foregroundColor(self.index == 2 ? .black : Color.black.opacity(0.35))
//                 }
//
////                 Button(action: {
////
////                     self.index = 3
////
////                 }) {
////
////                     Image(systemName: "house.fill")
////                         .foregroundColor(self.index == 3 ? .black : Color.black.opacity(0.35))
////                 }
//             }
//             .padding(.horizontal, 30)
//             .padding(.bottom, 12)
//             .padding(.top, 28)
//             .background(Color.white)
//             .clipShape(Curve(index: self.$index))
//
//         }.background(Color("1"))
//     }
// }
//
// struct Corners : Shape {
//
//     func path(in rect: CGRect) -> Path {
//
//         let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 40, height: 40))
//
//         return Path(path.cgPath)
//     }
// }
//
// struct Curve : Shape {
//
//     @Binding var index : Int
//
//     func path(in rect: CGRect) -> Path {
//
//         let path1 = Path{path in
//
//             path.move(to: CGPoint(x: 0, y: 0))
//             path.addLine(to: CGPoint(x: 0, y: rect.height))
//             path.addLine(to: CGPoint(x: rect.width, y: rect.height))
//             path.addLine(to: CGPoint(x: rect.width, y: 0))
//
//             path.addArc(center: CGPoint(x: getPosition(value: rect.width), y: 0), radius: 20, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
//         }
//
//         let path2 = Path{path in
//
//             path.move(to: CGPoint(x: 0, y: 0))
//             path.addArc(center: CGPoint(x: getPosition(value: rect.width), y: 5), radius: 5, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: false)
//
//         }
//
//         return Path{path in
//
//             path.addPath(path1)
//             path.addPath(path2)
//         }
//     }
//
//     func getPosition(value: CGFloat)->CGFloat{
//
//         var width : CGFloat
//         let spacing = (UIScreen.main.bounds.width) / 2
//
//         if index == 0{
//
//            width = spacing - (spacing / 2)
//         }
//         else if index == 1{
//
//            width = spacing
//         }
//         else if index == 2{
//
//            width = spacing * 3 - (spacing / 2) - 15
//         }
//         else{
//
//             width = value
//         }
//
//         return width
//     }
// }

// --------

//import SwiftUI
//
//struct MessageView: View {
//
//    @State var index = 0
//
//    var body: some View {
//        ZStack {
//
//            if self.index == 0 {
//                Color.red.edgesIgnoringSafeArea(.top)
//            }
//            else if self.index == 1 {
//                Color.yellow.edgesIgnoringSafeArea(.top)
//            }
//            else {
//                Color.blue.edgesIgnoringSafeArea(.top)
//            }
//
//            VStack {
//                Spacer()
//
//                TabBar(index: $index)
//            }
//        }
//    }
//}
//
//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView()
//    }
//}
//
//struct TabBar: View {
//
//    @Binding var index: Int
//
//    var body: some View {
//        HStack(spacing: 15) {
//            HStack {
//
//                Image(systemName: "house.fill").resizable().frame(width: 35, height: 30)
//
//                Text(self.index == 0 ? "읽지않은쪽지" : "").fontWeight(.light).font(.system(size: 14))
//            }.padding(15).background(self.index == 0 ? Color("1") : Color.clear).clipShape(Capsule()).onTapGesture {
//
//                self.index = 0
//
//            }
//
//
//            HStack {
//
//                Image(systemName: "person.fill").resizable().frame(width: 30, height: 30)
//
//                Text(self.index == 1 ? "받은쪽지" : "").fontWeight(.light).font(.system(size: 14))
//            }.padding(15).background(self.index == 1 ? Color.blue.opacity(0.5): Color.clear).clipShape(Capsule()).onTapGesture {
//
//                self.index = 1
//
//            }
//
//            HStack {
//
//                Image(systemName: "bell.fill").resizable().frame(width: 30, height: 32)
//
//                Text(self.index == 2 ? "보낸쪽지" : "").fontWeight(.light).font(.system(size: 14))
//            }.padding(15).background(self.index == 2 ? Color.green.opacity(0.5): Color.clear).clipShape(Capsule()).onTapGesture {
//
//                self.index = 2
//
//            }
//
////            HStack {
////
////                Image(systemName: "tv.fill").resizable().frame(width: 35, height: 30)
////
////                Text(self.index == 3 ? "Watch" : "").fontWeight(.light).font(.system(size: 14))
////            }.padding(15).background(self.index == 3 ? Color.yellow.opacity(0.5): Color.clear).clipShape(Capsule()).onTapGesture {
////
////                self.index = 3
////
////            }
//        }.padding(.top, 8).frame(width: UIScreen.main.bounds.width).background(Color.white).animation(.default)
//    }
//
//}
