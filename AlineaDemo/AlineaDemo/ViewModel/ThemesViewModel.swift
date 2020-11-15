//
//  ThemesViewModel.swift
//  AlineaDemo
//
//  Created by Reshma Pai on 15/11/20.
//  Copyright © 2020 demo. All rights reserved.
//

import UIKit

class ThemesViewModel : NSObject {
    
    fileprivate let model = Utility.createThemesModel()
    fileprivate var collectionView : UICollectionView!
    
    func setupUI(frame : CGRect) -> UIView {
        if collectionView == nil {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.backgroundColor = Colors.backgroundColor
        }
        
        registerCell()
        return collectionView
    }
    
    func registerCell() {
        collectionView.register(ThemesCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ThemesCollectionViewCell.self))
    }
}

extension ThemesViewModel : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ThemesCollectionViewCell.self), for: indexPath) as! ThemesCollectionViewCell
        let item = model[indexPath.row]
        cell.configureCell(item: item)
        return cell
    }
    
}

extension ThemesViewModel : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 15, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
