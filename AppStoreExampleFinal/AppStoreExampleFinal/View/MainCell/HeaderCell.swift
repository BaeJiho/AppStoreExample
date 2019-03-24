//
//  HeaderCell.swift
//  AppStoreExampleFinal
//
//  Created by 배지호 on 22/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class HeaderCell: AppCategoryCell {
    
    private let cellId = "headerInfoCell"
    
    override func setupView() {
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        appCollectionView.register(HeaderInfoCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(appCollectionView)
        appCollectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor, padding: .init(top: 0, left: 14, bottom: 0, right: 14), size: .zero)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HeaderInfoCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - 50, height: 200)
    }
}
