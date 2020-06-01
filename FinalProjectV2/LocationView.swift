//
//  LocationView.swift
//  FinalProjectV2
//
//  Created by Ryan Mai on 6/1/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    let data = DataLayer()
    @State var posts: [Post] = [
        .init(id: 2, account: Account(username: "Chipotle", profilePic: "ChipotleProfile", verified: true), location: Location(locationName: "Chipotle", locationImage: "", latitude: 0, longitude: 0, trending: true), description: "Stop in today for some free guac. It's on us!", picture: "ChipotlePost", ad: true)
    ]
    @State var firstStart = false
    
    var body: some View {
        
        VStack (spacing: 10) {
            MapView()
            .edgesIgnoringSafeArea(.top)
            .frame(height: 250)
            
            Image("ChipotleProfile")
            .resizable()
            .frame(width: 130, height: 130)
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            .offset(y: -108)
            .padding(.bottom, -130)
            
            VStack (alignment: .leading){
                Text("Chipotle Mexican Grill")
                    .font(.title)
                HStack {
                    Text("Oakton, VA")
                        .font(.subheadline)
                    Spacer()
                    Text("Open")
                        .foregroundColor(Color.green)
                }
            }.padding()
            
            VStack {
                List {
                    ForEach(refinePosts()!, id: \.id) { post in
                        PostView(post: post)
                    }
                }
            }.padding(.leading, -21)
           
        }.onAppear {
          
        }
    }
    
    func refinePosts() -> [Post]? {
        print("Here!")
        posts = data.decodeData()!.reversed()
        print(posts)
        for i in 0..<posts.count {
            posts[i].id = i
        }
        
//         for i in 0..<posts.count {
//            if posts[i].location.locationName != "Chipotle" {
//                posts.remove(at: i)
//            }
//        }
        print("I'm here!")
        return posts
    }
}

struct MapView: UIViewRepresentable {
    
    //@Binding var centerCoordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
