//
//  CharacterListViewController.swift
//  RickAndMorty-UIKit
//
//  Created by Doni on 7/4/23.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    var mainView: CharactersListView { self.view as! CharactersListView }
    
    private var tableViewDataSource: ListOfCharactersTableViewDataSource?
    private var tableViewDelegate: ListOfCharactersTableViewDelegate?
    
    private let apiClient: APIClient = APIClient()
    var characterDetailCoordinator: CharacterDetailPushCoordinator?
    
    override func loadView() {
        super.loadView()
        
        view = CharactersListView()
        
        tableViewDelegate = ListOfCharactersTableViewDelegate()
        
        tableViewDataSource = ListOfCharactersTableViewDataSource(tableView: mainView.charactersTableView)
        mainView.charactersTableView.dataSource = tableViewDataSource
        mainView.charactersTableView.delegate = tableViewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            
            guard let dataSource = self?.tableViewDataSource else {
                return
            }
            
            let character = dataSource.characters[index]
            self?.characterDetailCoordinator = CharacterDetailPushCoordinator(navigationController: self?.navigationController, character: character)
            self?.characterDetailCoordinator?.start()
        }
        
        Task {
            try await loadCharacters()
        }
    }
    
    func loadCharacters() async throws -> Void {
        do {
            let characters = try await apiClient.getCharacters()
            tableViewDataSource?.set(characters: characters.results)
        } catch {
            print(error)
        }
    }
    
}
