//
//  CharactersListView.swift
//  RickAndMorty-UIKit
//
//  Created by Doni on 7/3/23.
//

import UIKit

class CharactersListView: UIView {

    var charactersTableView: UITableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCharactersTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCharactersTableView() {
        
        addSubview(charactersTableView)
        
        charactersTableView.translatesAutoresizingMaskIntoConstraints = false
        
        charactersTableView.register(CharacterListCellView.self, forCellReuseIdentifier: "CharacterListCellView")
        
        NSLayoutConstraint.activate([
            charactersTableView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            charactersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            charactersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            charactersTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
