//
//  MovieTVCollectionViewCell.swift
//  Movilicious
//


import UIKit

class MovieTVCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Container - UIView:
    let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        view.layer.cornerRadius = 10
        return view
    }()
    
    // Poster:
    let posterImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.backgroundColor = .purple
        return img
    }()
    
    // Title:
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Title Label Goes Here"
        //lb.backgroundColor = .orange
        lb.font = UIFont.boldSystemFont(ofSize: 30)
        lb.textColor = .white
        lb.numberOfLines = 1
        return lb
    }()
    
    
    fileprivate func setupCell() {
        contentView.addSubview(posterImage)
        contentView.addSubview(container)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            // Poster Constraints:
            posterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            posterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            posterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            posterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            // Container Constraints:
            container.leadingAnchor.constraint(equalTo: posterImage.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: posterImage.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: posterImage.bottomAnchor),
            container.heightAnchor.constraint(equalToConstant: 80),
            // TitleLabel Constraints:
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor)
            
            
        ])
        
    }
    
}
