//
//  CharacterResponse.swift
//  RickAndMorty-UIKit
//
//  Created by Doni on 7/3/23.
//

import Foundation

struct CharacterResponse: Codable {
    let info: Info
    let results: [Character]
}
