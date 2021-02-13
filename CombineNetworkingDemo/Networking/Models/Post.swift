//
//  Post.swift
//  CombineNetworkingDemo
//
//  Created by Perry Hoekstra on 2/12/21.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}
