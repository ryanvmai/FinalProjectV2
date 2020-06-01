//
//  ProfileView.swift
//  FinalProjectV2
//
//  Created by Ryan Mai on 6/1/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    let data = DataLayer()
    @State var posts: [Post] = [
        .init(id: 0, account: Account(username: "ryanvmai", profilePic: "RyanProfile", verified: false), location: Location(locationName: "Gong Cha Tea", locationImage: "", latitude: 0, longitude: 0, trending: false), description: "Back at my favorite tea place in Boston!", picture: "Tea", ad: false),
        .init(id: 1, account: Account(username: "ryanvmai", profilePic: "RyanProfile", verified: false), location: Location(locationName: "Eataly, Boston", locationImage: "", latitude: 0, longitude: 0, trending: true), description: "Great Pasta on Newbury Street!", picture: "Noodles", ad: false),
        .init(id: 3, account: Account(username: "ryanvmai", profilePic: "RyanProfile", verified: false), location: Location(locationName: "HMart Food Court", locationImage: "", latitude: 0, longitude: 0, trending: false), description: "amazing Korean food at HMart!", picture: "HMart", ad: false)
    ]
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            HStack (spacing: 20) {
                Image("RyanProfile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                Text("Ryan Mai").font(.largeTitle)
            }.padding(.leading, 16).padding(.top, 16)
            List {
                ForEach(posts, id: \.id) { post in
                    PostView(post: post)
                }
            }
            .padding(.leading, -22.5)
        }.onAppear {
            //self.posts = self.data.decodeData()!.reversed()
//            for i in 0..<self.posts.count {
//                self.posts[i].id = i
//            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
