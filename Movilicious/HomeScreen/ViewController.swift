//
//  ViewController.swift
//  Movilicious
//  Created by ESSA AL on 7/28/20.
//

import UIKit

class ViewController: UIViewController {
    
    let presentation = HomePresentation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background Color:
        view.backgroundColor = UIColor(red: 44/255, green: 57/255, blue: 95/255, alpha: 1)
        // NavigationItems:
        navigationItem.title = "Movilicious"
        //navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor(red: 217/255, green: 48/255, blue: 80/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 23)]
        
        // This oddly made the search bar icon color WHITE:
        navigationController?.navigationBar.tintColor = .white
        
        // Navigation Right Button Search Item:
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        
        // Hider nav on swipe:
        //navigationController?.hidesBarsOnSwipe = true
        
        let searchBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(searchClass))
        navigationItem.rightBarButtonItem = searchBarButton
        
        // PRESENT COLLECTIONVIEW:
        presentation.viewController = self
        presentation.displayController()
        
    }
    
    @objc func searchClass(_ sender: UIBarButtonItem!) {
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }

}
