//
//  PostView.swift
//  FinalProjectV2
//
//  Created by Ryan Mai on 5/31/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import SwiftUI

//struct locationNameView: View {
//
//    var locationName: String
//
//    var body: some View {
//            ScrollView {
//                                       NavigationLink(destination: ContentView()) {
//                                           Text(post.location.locationName)
//                                           .font(.title)
//                                           .fontWeight(.semibold)
//                                       }
//                                   }.padding(.horizontal, 1.0).scaledToFit().frame(height: 60)
//    }
//}

struct PostView: View {
    
    let post: Post
    @State var liked = false
    
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            HStack (spacing: 10) {
                Image(post.account.profilePic)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                VStack (alignment: .leading, spacing: 0) {
                    HStack (spacing: 5) {
                        Image("Location")
                            .resizable()
                            .frame(width: 20, height: 28)
//                        NavigationLink(destination: ContentView()) {
//                            locationNameView(locationName: post.location.locationName)
//                        }
                        Text(post.location.locationName)
                            .font(.title)
                            .fontWeight(.semibold)
                           // .foregroundColor(Color.black)
                        if post.location.trending {
                            Image("Trending")
                                .resizable()
                                .frame(width: 20, height: 29)
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                    HStack {
//                        NavigationLink(destination: ContentView()) {
//                            Text(post.account.username)
//                                .font(.headline)
//                                .foregroundColor(Color.black)
//                            }
                        Text(post.account.username)
                            .font(.headline)
                           // .foregroundColor(Color.black)
                        if post.account.verified {
                            Image("Verified")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 15, height: 15)
                        }
                    }
                    if post.ad {
                        Text("Sponsored Content")
                            .font(.subheadline)
                    }
                }
            }
            Image(post.picture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 400, height: 400)
                .scaledToFill()
                .cornerRadius(10)
            HStack (spacing: 6){
                Button(action: {self.liked.toggle()}) {
                    if self.liked {
                        Image("Heart")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            //.scaledToFill()
                            .frame(width: 40, height: 40)
                    } else {
                        Image("Unliked")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                    }
                }.buttonStyle(PlainButtonStyle())
                Text(post.account.username + ":")
                    .font(.headline)
                    .fontWeight(.bold)
                Text(post.description)
                    .font(.headline)
                    .fontWeight(.regular)
            }
        }
        .padding(.all, 10.0)

    }
}


struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(id: 1, account: Account(username: "ryanvmai", profilePic: "RyanProfile", verified: true), location: Location(locationName: "Chipotle", locationImage: "ChipotlePost", latitude: 10, longitude: 10, trending: true), description: "This is a post description", picture: "ChipotlePost", ad: true))
    }
}
