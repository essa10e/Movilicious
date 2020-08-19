//
//  RecentSearch.swift
//  Movilicious
//
//  Created by ESSA AL on 8/13/20.
//

import UIKit

// Recent Search TableView Cell:

class recentSearchCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let wordLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "text"
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        lb.textColor = .white
        return lb
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        backgroundColor = UIColor(red: 44/255, green: 57/255, blue: 95/255, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(cellView)
        addSubview(wordLabel)
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            
            wordLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 2),
            wordLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: 10),
            wordLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10)
            ])
    }
}

