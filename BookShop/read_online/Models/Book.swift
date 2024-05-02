//
//  Book.swift
//  read_online
//
//  Created by marwa awwad mohamed awwad on 02/05/2024.
//

import Foundation

struct Book: Codable {
    let id: String
    let title: String
    let createdAt: Date
    let releasedOn: Date
    let description: String
    let updatedAt: Date
    let publisherId: String
    let isbn: String
    let subtitle: String
    let authorId: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case createdAt = "created_at"
        case releasedOn = "released_on"
        case description
        case updatedAt = "updated_at"
        case publisherId = "publisher_id"
        case isbn
        case subtitle
        case authorId = "author_id"
    }
}
