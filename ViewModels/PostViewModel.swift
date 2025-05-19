//
//  PostViewModel.swift
//  swiftui-combine-api-demo
//
//  Created by Sharda Prasad on 19/05/25.
//

import Foundation
import Combine

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var errorMessage: IdentifiableError?

    private var cancellables = Set<AnyCancellable>()
    private let service = APIService()
    
    func fetchPosts() {
        service.fetchPosts()
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    self.errorMessage = IdentifiableError(message: error.localizedDescription)
                }
            }, receiveValue: { posts in
                self.posts = posts
            })
            .store(in: &cancellables)
    }
}


struct IdentifiableError: Identifiable {
    let id = UUID()
    let message: String
}
