//
//  Character.swift
//  RickAndMorty
//
//  Created by Furkan Sarı on 30.07.2024.
//

import Foundation

struct Characters: Decodable {
    let results: [CharacterDetail]?
}

struct CharacterDetail: Decodable {
    let id: Int?
    let name: String?
}
