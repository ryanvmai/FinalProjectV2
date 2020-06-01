//
//  FeedView.swift
//  FinalProjectV2
//
//  Created by Ryan Mai on 6/1/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    
    var data: DataLayer = DataLayer()
    @State var posts: [Post] = [ ]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(posts, id: \.id) { post in
                        PostView(post: post)
                    }
                }
            }.padding(.leading, -20)
            .navigationBarTitle("Pinned")
        }.onAppear() {
            if self.data.startSystem() {
                self.posts = self.data.decodeData()!.reversed()
                for i in 0..<self.posts.count {
                    self.posts[i].id = i
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
