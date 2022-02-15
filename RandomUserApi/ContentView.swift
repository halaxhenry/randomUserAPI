//
//  ContentView.swift
//  RandomUserApi
//
//  Created by Seungchul Ha on 2022/02/15.
//

import SwiftUI

struct ContentView: View {
    
    // 사용하고자 하면 불러온다
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    
    
    var body: some View {
        
        List(randomUserViewModel.randomUsers){ aRandomUser in
            RandomUserRowView(aRandomUser)
        }
//        List(0...100, id: \.self){ index in
//            RandomUserRowView()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
