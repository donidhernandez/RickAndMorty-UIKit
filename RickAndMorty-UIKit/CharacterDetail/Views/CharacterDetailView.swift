//
//  CharacterDetailView.swift
//  RickAndMorty-UIKit
//
//  Created by Doni on 7/9/23.
//

import UIKit

class CharacterDetailView: UIView {
    
    let characterImageView   = UIImageView()
    let characterNameLabel   = UILabel()
    let characterStatusLabel = UILabel()
    let characterSpecieLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        configureCharacterImageView()
        configureCharacterNameLabel()
        configureCharacterStatusLabel()
        configureCharacterSpecieLabel()
    }
    
    func configureCharacterImageView() {
        addSubview(characterImageView)
        
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 12),
            characterImageView.heightAnchor.constraint(equalToConstant: 200),
            characterImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureCharacterNameLabel() {
        addSubview(characterNameLabel)
        
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        characterNameLabel.font = .systemFont(ofSize: 30, weight: .bold)
        characterNameLabel.textAlignment = .left
        characterNameLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 15),
            characterNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configureCharacterStatusLabel() {
        addSubview(characterStatusLabel)
        
        characterStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        characterStatusLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        characterStatusLabel.textAlignment = .left
        characterStatusLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            characterStatusLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 5),
            characterStatusLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configureCharacterSpecieLabel() {
        addSubview(characterSpecieLabel)
        
        characterSpecieLabel.translatesAutoresizingMaskIntoConstraints = false
        
        characterSpecieLabel.font = .systemFont(ofSize: 10, weight: .light)
        characterSpecieLabel.textAlignment = .left
        characterSpecieLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            characterSpecieLabel.topAnchor.constraint(equalTo: characterStatusLabel.bottomAnchor, constant: 5),
            characterSpecieLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configure(_ model: Character) {
        self.characterNameLabel.text = model.name
        self.characterSpecieLabel.text = model.species
        self.characterStatusLabel.text = model.status
        self.characterImageView.kf.setImage(with: URL(string: model.image))
    }
}
