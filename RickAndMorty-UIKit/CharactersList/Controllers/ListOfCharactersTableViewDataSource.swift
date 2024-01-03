//
//  ListOfCharactersTableViewDataSource.swift
//  RickAndMorty-UIKit
//
//  Created by Doni on 7/4/23.
//

import UIKit

final class ListOfCharactersTableViewDataSource: NSObject, UITableViewDataSource {
  
    private let tableView: UITableView
    
    private(set) var characters: [Character] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, characters: [Character] = []) {
        self.tableView = tableView
        self.characters = characters
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterListCellView", for: indexPath) as! CharacterListCellView
        
        let character = characters[indexPath.row]
        cell.setup(character)
        return cell
    }
    
    
    func set(characters: [Character]) {
        self.characters = characters
    }
    
  
    
}
