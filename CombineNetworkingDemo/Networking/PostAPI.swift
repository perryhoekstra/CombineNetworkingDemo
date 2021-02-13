//
//  PostAPI.swift
//  CombineNetworkingDemo
//
//  Created by Perry Hoekstra on 2/12/21.
//

import Foundation
import Combine

enum PostAPI {
    static let apiClient = APIClient()
    static let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
}

extension PostAPI {
    static func posts() -> AnyPublisher<[Post], Error> {
        let request = URLRequest(url: baseURL.appendingPathComponent("/posts"))
    
        return apiClient.networkRequest(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
