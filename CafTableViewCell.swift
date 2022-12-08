//
//  CafTableViewCell.swift
//  LGStarter
//
//  Created by V K on 08.12.2022.
//

import UIKit

class CafTableViewCell: UITableViewCell {
    
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var heartimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupConstraints() {
        let padding: CGFloat = 8
        let labelHeight: CGFloat = 20
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            ratingLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            heartimageView.heightAnchor.constraint(equalToConstant: 16),
            heartimageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            heartimageView.widthAnchor.constraint(equalToConstant: 16),
            heartimageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(heartimageView)
//        contentView.backgroundColor = .white
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configure(caf: Cafeteria) {
        nameLabel.text = caf.name
        ratingLabel.text = "Rating: \(caf.getRatingString())"
    }
    
    func toggleHeart(isFav: Bool) {
        heartimageView.isHidden = !isFav
    }
}
