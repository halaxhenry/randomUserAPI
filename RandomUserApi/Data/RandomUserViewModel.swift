//
//  RandomUserViewModel.swift
//  RandomUserApi
//
//  Created by Seungchul Ha on 2022/02/15.
//

import Foundation
import Combine
import Alamofire

// API 호출 하는 곳

// ObservableObject 를 사용하면 이벤트를 받을 수 가 있다
class RandomUserViewModel: ObservableObject{
    
    // MARK: - Properties
    var subscription = Set<AnyCancellable>() // combine 이해가 안가면 콤바인 영상 보면서 개념 잡기 (메모리에서 날리는 도구)
    
    @Published var randomUsers = [RandomUser]()
    
    var baseURL = "https://randomuser.me/api/?results=50"
    
    // alamofire 호출
    // 랜덤유저 뷰모델 생성될때 api 땡길껍니다
    init() {
        print("Init")
        fetchRandomUsers()
    }
    
    func fetchRandomUsers() {
        AF.request(baseURL)
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap{ $0.value } // optional 값을 제거하는 방법으로 , 옵셔널중 값이 있는 것만 가져온다 (언맵핑)
            .map{ $0.results } // 한번더 정제해서 results 만 가져오겠다!!!
            .sink(receiveCompletion: { completion in
                print("데이터스트림 완료 ")
            }, receiveValue: { receivedValue in
                print("받은 값: \(receivedValue.count)")
                self.randomUsers = receivedValue
            }).store(in: &subscription)
    }
    
    
    
}
