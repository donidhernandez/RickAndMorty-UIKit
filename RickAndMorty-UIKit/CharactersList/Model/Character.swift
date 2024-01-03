//
//  Character.swift
//  RickAndMorty-UIKit
//
//  Created by Doni on 7/3/23.
//

import Foundation

struct Character: Identifiable, Hashable, Codable {
    var id: Int
    let name: String
    let status: Status.RawValue
    let species: String
    let image: String
    let gender: Gender.RawValue
}

enum Status: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

enum Gender: String {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}
