//
//  HomePresentation.swift
//  Movilicious
//

import UIKit

class HomePresentation: NSObject, UICollectionViewDelegate {
    
    weak var viewController: ViewController?
    var dataSource = HomeDataSource()
    
    var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.minimumLineSpacing = 10
        flow.scrollDirection = .vertical
        
        let mainScreen = UIScreen.main.bounds
        flow.itemSize = CGSize(width: mainScreen.width, height: mainScreen.width)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flow)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    func displayController() {
        guard let viewController = viewController else {return}
        
        viewController.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: viewController.view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor).isActive = true
        
        // Register CELL:
        collectionView.register(MovieTVCollectionViewCell.self, forCellWithReuseIdentifier: "mtCell")
        collectionView.dataSource = dataSource
        
        collectionView.delegate = self
        
        dataSource.fetchData()
    }
    
    // MARK:- CollectionView Delegate:
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailview = DetailView()
       
        if indexPath.section == 0 {
            let MOVIE = dataSource.trendingMO[indexPath.item]
            detailview.setMovieData(moData: MOVIE)
            self.viewController?.navigationController?.pushViewController(DetailView(), animated: true)
        } else {
            let TV = dataSource.trendingTV[indexPath.item]
            detailview.setTVData(tvData: TV)
            self.viewController?.navigationController?.pushViewController(DetailView(), animated: true)
        }
    }
}

