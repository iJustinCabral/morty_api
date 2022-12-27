//
//  CharacterServiceResult.swift
//  RickAndMortyAPI
//
//  Created by Justin Cabral on 12/27/22.
//

import Foundation

struct CharacterServiceResult: Codable {
    let results: [Character]
}

struct Character : Codable, Hashable {
    let id: Int
    let name: String
    let image: String
    let status: String
}
 
