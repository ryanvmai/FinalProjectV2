//
//  DataLayer.swift
//  FinalProjectV2
//
//  Created by Ryan Mai on 5/31/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import Foundation

class DataLayer {
    
    let defaults = UserDefaults.standard
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    init() { }
    
    var posts: [Post] = [
        .init(id: 0, account: Account(username: "ryanvmai", profilePic: "RyanProfile", verified: false), location: Location(locationName: "Gong Cha Tea", locationImage: "", latitude: 0, longitude: 0, trending: false), description: "Back at my favorite tea place in Boston!", picture: "Tea", ad: false),
        .init(id: 1, account: Account(username: "ryanvmai", profilePic: "RyanProfile", verified: false), location: Location(locationName: "Eataly, Boston", locationImage: "", latitude: 0, longitude: 0, trending: true), description: "Great Pasta on Newbury Street!", picture: "Noodles", ad: false),
        .init(id: 2, account: Account(username: "Chipotle", profilePic: "ChipotleProfile", verified: true), location: Location(locationName: "Chipotle", locationImage: "", latitude: 0, longitude: 0, trending: true), description: "Stop in today for some free guac. It's on us!", picture: "ChipotlePost", ad: true),
        .init(id: 3, account: Account(username: "ryanvmai", profilePic: "RyanProfile", verified: false), location: Location(locationName: "HMart Food Court", locationImage: "", latitude: 0, longitude: 0, trending: false), description: "amazing Korean food at HMart!", picture: "HMart", ad: false)
    ]
    
    func startSystem() -> Bool {
        if let _ = defaults.object(forKey: "posts") as? Data {
            return true
        }
        if let encodedData = try? encoder.encode(posts) {
            defaults.set(encodedData, forKey: "posts")
            return true
        }
        return false
    }
    
    func decodeData() -> [Post]? {
        if let encodedData = defaults.object(forKey: "posts") as? Data {
            do {
                return try decoder.decode([Post].self, from: encodedData)
            } catch {
                print("Error")
            }
        }
        return nil
    }
    
    func encodeNewPost(post: Post) {
        posts.append(post)
        if let encodedData = try? encoder.encode(posts) {
            defaults.set(encodedData, forKey: "posts")
        }
    }
    
    func encode(newPosts: [Post]) {
        if let encodedData = try? encoder.encode(newPosts) {
            defaults.set(encodedData, forKey: "posts")
        }
    }
    
}
