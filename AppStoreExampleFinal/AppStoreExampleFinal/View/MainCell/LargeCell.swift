//
//  LargeCell.swift
//  AppStoreExampleFinal
//
//  Created by 배지호 on 21/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class LargeCell: AppCategoryCell {
    
    private let cellId = "largeDetailCell"
    override func setupView() {
        super.setupView()
        appCollectionView.register(LargeCategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LargeCategoryCell
        cell.app = app?.apps[indexPath.item]
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 200, height: frame.height - 50)
//    }
}
