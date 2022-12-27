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
    let type: String
    let species: String
    let gender: String
    let episode: [String]
    let location: Location
    let origin: Origin
}

struct Location : Codable, Hashable {
    let name: String
    let url: String
}
 
struct Origin : Codable, Hashable {
    let name: String
    let url: String
}
