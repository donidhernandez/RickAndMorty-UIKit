//
//  CharacterDetailViewController.swift
//  RickAndMorty-UIKit
//
//  Created by Doni on 7/9/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var characterDetailView: CharacterDetailView { self.view as! CharacterDetailView }
    
    init(character: Character) {
        super.init(nibName: nil, bundle: nil)
        characterDetailView.configure(character)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = CharacterDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
