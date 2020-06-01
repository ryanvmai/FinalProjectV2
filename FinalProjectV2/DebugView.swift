//
//  DebugView.swift
//  FinalProjectV2
//
//  Created by Ryan Mai on 6/1/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import SwiftUI

struct DebugView: View {
    
    var data = DataLayer()
    var posts: [Post] = [
        .init(id: 0, account: Account(username: "ryanvmai", profilePic: "RyanProfile", verified: false), location: Location(locationName: "Gong Cha Tea", locationImage: "", latitude: 0, longitude: 0, trending: false), description: "Back at my favorite tea place in Boston!", picture: "Tea", ad: false),
        .init(id: 1, account: Account(username: "ryanvmai", profilePic: "RyanProfile", verified: false), location: Location(locationName: "Eataly, Boston", locationImage: "", latitude: 0, longitude: 0, trending: true), description: "Great Pasta on Newbury Street!", picture: "Noodles", ad: false),
        .init(id: 2, account: Account(username: "Chipotle", profilePic: "ChipotleProfile", verified: true), location: Location(locationName: "Chipotle", locationImage: "", latitude: 0, longitude: 0, trending: true), description: "Stop in today for some free guac. It's on us!", picture: "ChipotlePost", ad: true),
        .init(id: 3, account: Account(username: "ryanvmai", profilePic: "RyanProfile", verified: false), location: Location(locationName: "HMart Food Court", locationImage: "", latitude: 0, longitude: 0, trending: false), description: "amazing Korean food at HMart!", picture: "HMart", ad: false)
    ]
    
    var body: some View {
        Button(action: {self.debugFeed()}) {
            Text("Revert to original posts")
        }
    }
    
    func debugFeed() {
        data.encode(newPosts: self.posts)
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
