//
//  CharacterDetailPushCoordinator.swift
//  RickAndMorty-UIKit
//
//  Created by Doni on 7/3/23.
//

import UIKit

class CharacterDetailPushCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var character: Character?
    
    init(navigationController: UINavigationController?, character: Character?) {
        self.navigationController = navigationController
        self.character = character
    }
    
    func start() {
        
    }
}
