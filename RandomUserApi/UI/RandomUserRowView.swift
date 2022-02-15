//
//  RandomUserRowView.swift
//  RandomUserApi
//
//  Created by Seungchul Ha on 2022/02/15.
//

import Foundation
import SwiftUI

struct RandomUserRowView: View {
    
    var randomUser: RandomUser
    
    init(_ randomUser: RandomUser) {
        self.randomUser = randomUser
    }
    
    var body: some View {
        HStack {
            ProfileImageView(imageURL: randomUser.profileImgUrl)
            Text("\(randomUser.description)")
                .fontWeight(.heavy)
                .font(.system(size: 25))
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading).padding(.vertical)
    }
}

struct RandomUserRowView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserRowView(RandomUser.getDummy())
    }
}
