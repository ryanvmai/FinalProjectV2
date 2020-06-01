//
//  ContentView.swift
//  FinalProjectV2
//
//  Created by Ryan Mai on 5/31/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Feed")
            }
            CreatePostView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Create Post")
            }
            LocationView()
                .tabItem {
                    Image(systemName: "pin")
                    Text("Location")
            }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
            }
            DebugView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Debug")
                       }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
