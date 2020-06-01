//
//  DataModels.swift
//  FinalProjectV2
//
//  Created by Ryan Mai on 5/31/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import Foundation

struct Account: Codable {
    let username: String
    var verified: Bool
    var profilePic: String
    
    init(username: String, profilePic: String, verified: Bool) {
        self.username = username
        self.profilePic = profilePic
        self.verified = verified
    }
}

struct Location: Codable {
    var locationName, locationImage: String
    var trending: Bool
    var latitude, longitude: Double
    
    init(locationName: String, locationImage: String, latitude: Double, longitude: Double, trending: Bool) {
        self.locationName = locationName
        self.locationImage = locationImage
        self.latitude = latitude
        self.longitude = longitude
        self.trending = trending
    }
}

struct Post: Codable {
    var id: Int
    let account: Account
    let location: Location
    let description, picture: String
    let ad: Bool
    
    init(id: Int, account: Account, location: Location, description: String, picture: String, ad: Bool) {
        self.id = id
        self.account = account
        self.location = location
        self.description = description
        self.picture = picture
        self.ad = ad
    }
}

struct Posts: Codable {
    let posts: [Post]
    
    init(posts: [Post]) {
        self.posts = posts
    }
}
