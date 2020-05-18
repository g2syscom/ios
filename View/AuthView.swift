//
//  AuthView.swift
//  SmartGW
//
//  Created by Daniel Roh on 2020/03/29.
//  Copyright © 2020 G2. All rights reserved.

//  Login page

import SwiftUI
import Combine
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct BottomLineTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack() {
            configuration
                .colorMultiply(.white).foregroundColor(.white).accentColor(.white)
            
            Rectangle()
                .frame(height: 1, alignment: .bottom)
                .foregroundColor(Color.white)
        }
    }
}



struct TextArea: UIViewRepresentable {
    @State var placeholder: String
    @Binding var text: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self, placeholder: placeholder)
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.text = placeholder

        textView.textColor = .red

        textView.delegate = context.coordinator
        return textView
    }

    func updateUIView(_ textView: UITextView, context: Context) {
        if !text.isEmpty {
            textView.text = text
            textView.textColor = .black
        }
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var textArea: TextArea
        var placeholder: String

        init(_ textArea: TextArea, placeholder: String) {
            self.textArea = textArea
            self.placeholder = placeholder
        }

        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .red {
                textView.text = nil
                textView.textColor = .black
            }
        }

        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = placeholder
                textView.textColor = UIColor.lightGray
            }
        }
    }
}

struct CustomTextField: View {
    var placeHolder: String
    @Binding var value: String

    var lineColor: Color
    var width: CGFloat

    var body: some View {
        VStack {
            TextField(self.placeHolder, text: $value)
            .padding()
                .font(.title).foregroundColor(.white)

            Rectangle().frame(height: self.width)
                .padding(.horizontal, 20).foregroundColor(self.lineColor)
        }
    }
}


struct AuthView: View {
    @State var showAuthView: Bool = false
    @State var showSettingView: Bool = false
    @State var user: String = ""
    @State var pass: String = ""
    @State var value: CGFloat = 0
    
    @State var selected = ""
    @State var show = false
    @ObservedObject var codeOne = SettingCodeOne()
    @ObservedObject var codeTwo = SettingCodeTwo()
    
    
    @ObservedObject var networkManager = NetworkManager()
    
    

    func signIn() {
        
        Gpass.user = self.user
        Gpass.pass = self.pass
        self.networkManager.fetchData()
        print(networkManager.posts)
        let time = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: time) {
            if self.networkManager.posts.count > 0{
                withAnimation() {
                    self.showAuthView = true
                    print(self.user)
                    print(self.pass)
                }
            } else {
                print("error log")
                print("\(self.codeTwo.text)")
                print("\(Gpass.user)")
                print("\(Gpass.pass)")
            }
        }
        UIApplication.shared.endEditing()
        
    }
    

    
    
    
    var body: some View {
        
            VStack {
                        if showAuthView {
                            MainView().transition(.slide)
                        }
                        else if showSettingView {
                            SettingView()
                        }
                        else {
                            ZStack {
                                
                                Rectangle().foregroundColor(Color("1")).edgesIgnoringSafeArea(.all)
                                
                                VStack{
                                    
                                    HStack{
                                        Image("logo_top").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 300, alignment: .leading)
                                        Rectangle().foregroundColor(Color("1"))
                                    }

                                    HStack(alignment: .bottom) {
                                        Rectangle().foregroundColor(Color("1"))
                                        Image("logo_bottom").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 200, alignment: .leading)
                                    }.edgesIgnoringSafeArea(.all)

                                }
                                
                                
                                
                                
                                
                                
                                VStack(spacing: 10) {
                                    Spacer().frame(height:320)
                                    
                                    Image("logo_main").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 200, alignment: .topLeading)
                                    Spacer().frame(height:20)
                                    HStack{
                                        Image(systemName: "person.fill").resizable().frame(width: 20, height: 20).padding(.leading, 3).foregroundColor(Color(.white))
                                        

                                        
                                            
                                        
                                        TextField("아이디", text: $user).textFieldStyle(BottomLineTextFieldStyle()).foregroundColor(.white).font(.system(size: 20))
                                        
                                        
                                    }



                                    Spacer().frame(height: 5)
                                    HStack{
                                        Image(systemName: "lock.fill").resizable().frame(width: 16, height: 20).padding(.leading, 3).foregroundColor(Color(.white))
                                        TextField("비밀번호",text: $pass).textFieldStyle(BottomLineTextFieldStyle()).foregroundColor(.white).font(.system(size: 20))
            
                                                }
                                                .offset(y: 0)
                                    Spacer().frame(height: 20)
                                    HStack {
                                        Button(action: signIn) {
                                            
                                            

                                            Text("로그인").foregroundColor(.white).padding().frame(width: 100).background(Color(red: 0.19, green: 0.25, blue: 0.62))
                                            }
                                        
                                        



                                        Spacer().frame(width: 50)
                                        
                                        
                                        Button(action: {
                                            self.show.toggle()
                                        }) {
                                            Text("세팅").foregroundColor(.white).padding().frame(width: 100).background(Color(red: 0.19, green: 0.25, blue: 0.62))
                                            }
                                        
                                    }
                                    
                                    
                                }
                                    .padding(.horizontal, 40)

                                VStack {
                                    Spacer()
                                    RadioButtons(selected: self.$selected, show: self.$show).offset(y: self.show ? (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 60 : UIScreen.main.bounds.height)
                                    }.background(Color(UIColor.label.withAlphaComponent(self.show ? 0.2 : 0)).edgesIgnoringSafeArea(.all)).padding(.vertical)
                            }
                                .edgesIgnoringSafeArea(.all).animation(.default)
                                
                                .offset(y: -(self.value)*0.9)
                            .animation(.easeInOut)
                            .onAppear {
                                       NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in

                                           let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                                           let height = value.height

                                           self.value = height

                                       }
                                       NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in

                                           self.value = 0

                                       }
                                   }
                                
                        }
                        
                    }
        
        
        
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}






struct ExDivider: View {
    let color: Color = Color("1")
    let width: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}


