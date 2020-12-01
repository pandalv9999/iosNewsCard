//
//  Data.swift
//  iosNewsCard
//
//  Created by Rujun Yao on 11/30/20.
//

import Foundation

// convert json file into swift class.
struct Response: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}
