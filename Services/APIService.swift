//
//  APIService.swift
//  swiftui-combine-api-demo
//
//  Created by Sharda Prasad on 19/05/25.
//

import Foundation
import Combine

class APIService {
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
