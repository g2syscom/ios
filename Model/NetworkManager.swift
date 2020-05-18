//
//  NetworkManager.swift
//  SmartGW
//  "183.111.148.229"
//  Created by Daniel Roh on 2020/04/05.
//  Copyright © 2020 G2. All rights reserved.



import Foundation
import SwiftUI
import Combine

extension UserDefaults {
    @objc dynamic var textKey1: String {
        return string(forKey: "textKey1") ?? ""
    }
    
    @objc dynamic var textKey2: String {
        return string(forKey: "textKey2") ?? ""
    }
}

class SettingCodeOne: ObservableObject { 

    private static let userDefaultTextKey = "textKey1"
    @Published var text: String = UserDefaults.standard.string(forKey: SettingCodeOne.userDefaultTextKey) ?? ""

    private var canc: AnyCancellable!
    private var observer: NSKeyValueObservation!

    init() {
        canc = $text.debounce(for: 0.2, scheduler: DispatchQueue.main).sink { newText in
            UserDefaults.standard.set(newText, forKey: SettingCodeOne.userDefaultTextKey)
        }
        observer = UserDefaults.standard.observe(\.textKey1, options: [.new]) { _, value in
            if let newValue = value.newValue, self.text != newValue {
                self.text = newValue
            }
        }
    }
}

class SettingCodeTwo: ObservableObject {

    private static let userDefaultTextKey = "textKey2"
    @Published var text: String = UserDefaults.standard.string(forKey: SettingCodeTwo.userDefaultTextKey) ?? ""

    private var canc: AnyCancellable!
    private var observer: NSKeyValueObservation!

    init() {
        canc = $text.debounce(for: 0.2, scheduler: DispatchQueue.main).sink { newText in
            UserDefaults.standard.set(newText, forKey: SettingCodeTwo.userDefaultTextKey)
        }
        observer = UserDefaults.standard.observe(\.textKey2, options: [.new]) { _, value in
            if let newValue = value.newValue, self.text != newValue {
                self.text = newValue
            }
        }
    }
}


class NetworkManager: ObservableObject {
    
    var codeOne = SettingCodeOne()
    var codeTwo = SettingCodeTwo()
    @Published var posts = [Post]()

    
    
    func fetchData() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "\(self.codeTwo.text)"
        urlComponents.path = "/mob_json/mob_json.aspx"
        urlComponents.queryItems = [
            URLQueryItem(name: "nm_sp", value: "UP_MOB_CHECK_LOGIN"),
            URLQueryItem(name: "param", value: "\(self.codeOne.text)|\(Gpass.user)|\(Gpass.pass)")
        ]
        
        if let url = urlComponents.url {
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)

                            
                            DispatchQueue.main.async {
                                self.posts = results.Table

                            }   
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
            
        }
        
    }
}



