//
//  LargeCategoryCell.swift
//  AppStoreExample
//
//  Created by 배지호 on 19/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class LargeCategoryCell: CategoryCollectionViewCell {
    
    var detailViewController:AppStoreViewController?
    private let appLargeCellId = "appLargeCellId"
    
    override func setupView() {
        super.setupView()
        appsCollectionView.register(AppLargeCell.self, forCellWithReuseIdentifier: appLargeCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appLargeCellId, for: indexPath) as! AppLargeCell
        cell.apps = categories?.apps[indexPath.item]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let app = categories?.apps[indexPath.item] else {return}
        detailViewController?.showDetailView(app: app)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 32)
    }
}

