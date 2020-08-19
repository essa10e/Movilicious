//
//  DetailViewController.swift
//  Movilicious
//
//  Created by ESSA AL on 8/6/20.
//

import UIKit


class DetailViewController {
    
    weak var viewController: ViewController?
    var dataSource = DetailViewControllerDataSource()

    // Container:
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    // Dismiss Button:
    let dismiss: UIButton = {
        let btn = UIButton(type: .system)
        //btn.setImage()
        return btn
    }()
    
    // Poster:
    let posterImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.backgroundColor = .purple
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
    
    
    fileprivate func setupCell() {
        guard let viewController = viewController else {return}
        
        viewController.view.addSubview(container)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 0),
            container.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor, constant: 0),
            container.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor, constant: 0),
            container.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor, constant: 0),
            
        ])
        
    }
}
