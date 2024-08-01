//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Furkan Sarı on 28.07.2024.
//

import UIKit


final class CharacterCell: UITableViewCell {
    let identifier = "CharacterCell"
    let nameLabel = UILabel()
    let stackView = UIStackView()
    let infoLabel = UILabel()
    let characterImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(systemName: "person")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(characterDetail: CharacterDetail?) {
        characterImageView.image = UIImage(systemName: "person")
        characterImageView.layer.borderWidth = 2
        characterImageView.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(infoLabel)
        stackView.axis = .vertical
        stackView.spacing = 16
        nameLabel.text = characterDetail?.name
        infoLabel.text = "id: \(characterDetail?.id ?? 0000)"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(characterImageView)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
           
            characterImageView.widthAnchor.constraint(equalToConstant: 60),
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            characterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: characterImageView.topAnchor, constant: 16)
            
        ])
    }
}
