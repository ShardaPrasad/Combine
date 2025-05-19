//
//  Post.swift
//  swiftui-combine-api-demo
//
//  Created by Sharda Prasad on 19/05/25.
//

import Foundation

struct Post: Identifiable, Codable {
    let id: Int
    let title: String
    let body: String
}
