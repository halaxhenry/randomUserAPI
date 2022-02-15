//
//  ProfileImageView.swift
//  RandomUserApi
//
//  Created by Seungchul Ha on 2022/02/15.
//

import Foundation
import SwiftUI
import URLImage

struct ProfileImageView: View {
    
    var imageURL: URL
    
    var body: some View {
        URLImage(imageURL,
                 content: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        })
            .frame(width: 50, height: 60)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
    }
}


struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "https://randomuser.me/api/portraits/women/48.jpg")!
        
        ProfileImageView(imageURL: url)
    }
}
