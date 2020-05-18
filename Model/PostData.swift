//
//  PostData.swift
//  SmartGW
//
//  Created by Daniel Roh on 2020/04/05.
//  Copyright © 2020 G2. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let Table: [Post]
}
// Add variable to this struct if you want fetch more data from json
struct Post: Decodable, Identifiable {
    var id: String {
        return CD_FIRM
    }
    let CD_FIRM: String
    let NM_FIRM: String
    let CD_USER: String
    let NM_USER: String
}



struct Gpass {
    static var user = ""
    static var pass = ""
}


