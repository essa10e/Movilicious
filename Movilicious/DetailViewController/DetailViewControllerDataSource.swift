//
//  DetailViewControllerDataSource.swift
//  Movilicious
//
//  Created by ESSA AL on 8/6/20.
//

import UIKit

class DetailViewControllerDataSource: NSObject, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath)
        
        return cell
    }
}
