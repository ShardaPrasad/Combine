//
//  ContentView.swift
//  swiftui-combine-api-demo
//
//  Created by Sharda Prasad on 19/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PostViewModel()

    var body: some View {
        
        NavigationView {
            List(viewModel.posts) { post in
                
                NavigationLink(destination: PostDetailView(post: post)) {
                    Text(post.title)
                        .font(.headline)
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.fetchPosts()
            }
            .alert(item: $viewModel.errorMessage) { error in
                Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    ContentView()
}
