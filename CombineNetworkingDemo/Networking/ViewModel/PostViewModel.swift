//
//  PostViewModel.swift
//  CombineNetworkingDemo
//
//  Created by Perry Hoekstra on 2/12/21.
//

import Foundation
import Combine

class PostViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    @Published var isLoading = true
    
    var cancellationToken: AnyCancellable?
    
    init() {
        getPosts()
    }
}

extension PostViewModel {
    func getPosts() {
        cancellationToken = PostAPI.posts()
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.posts = $0
                    self.isLoading = false
                  })
    }
    
}
