//
//  SmartNotesView.swift
//  SmartGW
//
//  Created by Daniel Roh on 2020/04/04.
//  Copyright © 2020 G2. All rights reserved.
//

import SwiftUI



// fetch observed string value
struct SmartNotesView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    
    var body: some View {
        ZStack {
            NavigationView {
                
                List(networkManager.posts) { post in
                        VStack {

                            Text(post.CD_FIRM)
                            Text(post.NM_FIRM)
                            Text(post.NM_USER)
                        }
                    }
                
            }.onAppear {
                self.networkManager.fetchData()
            }
        }
    }
}

struct SmartNotesView_Previews: PreviewProvider {
    static var previews: some View {
        SmartNotesView()
    }
}






