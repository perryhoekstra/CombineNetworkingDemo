//
//  PostUIView.swift
//  CombineNetworkingDemo
//
//  Created by Perry Hoekstra on 2/12/21.
//

import SwiftUI

struct PostUIView: View {
    @ObservedObject var postViewModel = PostViewModel()
        
    var body: some View {
        ActivityHudView(isShowing: $postViewModel.isLoading) {
            List(postViewModel.posts) { post in
                HStack {
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}

struct PostUIView_Previews: PreviewProvider {
    static var previews: some View {
        PostUIView()
    }
}
