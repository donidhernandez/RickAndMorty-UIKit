//
//  CharacterListCellView.swift
//  RickAndMorty-UIKit
//
//  Created by Doni on 7/3/23.
//

import UIKit
import Kingfisher

class CharacterListCellView: UITableViewCell {

    var characterImageView: UIImageView = UIImageView()
    var characterName: UILabel          = UILabel()
    var characterStatus: UILabel        = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        configureCharacterImageView()
        configureName()
        configureStatus()
    }
    
    func configureCharacterImageView() {
        addSubview(characterImageView)
        
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        characterImageView.contentMode = .scaleAspectFit
        characterImageView.layer.borderWidth = 1
        characterImageView.layer.masksToBounds = false
        characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
        characterImageView.layer.borderColor = UIColor.black.cgColor
        characterImageView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            characterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            characterImageView.widthAnchor.constraint(equalToConstant: 40),
            characterImageView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func configureName() {
        addSubview(characterName)
        
        characterName.translatesAutoresizingMaskIntoConstraints = false
        characterName.font = .systemFont(ofSize: 20, weight: .bold)
        
        NSLayoutConstraint.activate([
            characterName.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            characterName.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 15),
        ])
    }
    
    func configureStatus() {
        addSubview(characterStatus)
        
        characterStatus.translatesAutoresizingMaskIntoConstraints = false
        characterStatus.font = .systemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            characterStatus.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 5),
            characterStatus.leadingAnchor.constraint(equalTo: characterName.leadingAnchor),
        ])
    }
    
    func setup(_ model: Character) {
        self.characterName.text = model.name
        self.characterStatus.text = model.status
        self.characterImageView.kf.setImage(with: URL(string: model.image))
    }
    
}
