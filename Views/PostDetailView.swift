//
//  PostDetailView.swift
//  swiftui-combine-api-demo
//
//  Created by Sharda Prasad on 19/05/25.
//

import Foundation
import SwiftUI

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(post.title)
                .font(.title)
                .bold()
            Text(post.body)
                .font(.body)
        }
        .padding()
        .navigationTitle("Post Detail")
    }
}
