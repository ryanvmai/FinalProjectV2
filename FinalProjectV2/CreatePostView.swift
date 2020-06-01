//
//  CreatePostView.swift
//  FinalProjectV2
//
//  Created by Ryan Mai on 6/1/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import SwiftUI

struct CreatePostView: View {
    var data: DataLayer = DataLayer()
    //@State var posts: [Post] = [ ]
    
    var body: some View {
        Button(action: {self.addNewPost()}) {
            Text("Create new post")
        }
    }
    
    func addNewPost() {
        let post: Post = Post(id: self.data.posts.count-1, account: Account(username: "ryanvmai", profilePic: "RyanProfile", verified: false), location: Location(locationName: "Test", locationImage: "", latitude: 0, longitude: 0, trending: false), description: "This is a test", picture: "Tea", ad: false)
        data.encodeNewPost(post: post)
    }
    
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
