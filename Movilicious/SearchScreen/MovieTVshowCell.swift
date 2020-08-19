//
//  MovieTVSearchCell.swift
//  Movilicious
//
//  Created by ESSA AL on 8/13/20.
//

import UIKit

// Search Movie + TV TableView CELL:
class MovieTVshowCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        backgroundColor = UIColor(red: 44/255, green: 57/255, blue: 95/255, alpha: 1)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // all elements required for the cell:
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 44/255, green: 57/255, blue: 95/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Poster:
    let posterImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        
        return img
    }()
    
    // Title:
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        //lb.text = "Title Goes Here..."
        //lb.backgroundColor = .orange
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.textColor = .white
        lb.numberOfLines = 1
        return lb
    }()
    
    // Preview:
    let previewText: UITextView = {
        let txView = UITextView()
        txView.translatesAutoresizingMaskIntoConstraints = false
        txView.backgroundColor = .clear
        //txView.text = ""
        txView.textColor = .white
        txView.isScrollEnabled = false
        txView.textContainer.maximumNumberOfLines = 0
        txView.textContainer.lineBreakMode = .byTruncatingTail
        txView.isEditable = false
        txView.font = UIFont.systemFont(ofSize: 15)
        return txView
    }()
    
    
    func setUpViews() {
        addSubview(cellView)
        addSubview(posterImage)
        addSubview(titleLabel)
        addSubview(previewText)
        NSLayoutConstraint.activate([
            // UIView:
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            cellView.heightAnchor.constraint(equalToConstant: 200),
            //cellView.widthAnchor.constraint(equalToConstant: 499),
            
            // UIImageView: => Poster.
            posterImage.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 0),
            posterImage.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 5),
            posterImage.widthAnchor.constraint(equalToConstant: 135),
            posterImage.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: 0),
            
            
            // UILable: -> Original Title.
            titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 2),
            titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            
            // UITextView: -> Movie/TV preview.
            previewText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            previewText.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 10),
            previewText.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            previewText.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10)
            
            // UI.. -> rating.
            
            ])
    }
}
