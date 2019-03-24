//
//  ViewController.swift
//  AppStoreExampleFinal
//
//  Created by 배지호 on 20/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    private let largeCellId = "largeCellId"
    private let headerCellId = "headerCellId"
    var appCategories: AppCategory?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCellId)
        collectionView.register(AppCategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(LargeCell.self, forCellWithReuseIdentifier: largeCellId)
        Categories.fetchData { (response) in
            print("response : \(response)")
            self.appCategories = response
            self.collectionView.reloadData()
        }
        self.collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellId, for: indexPath) as! HeaderCell
        header.app = appCategories?.bannerCategory
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let data = appCategories?.appCategory {
            return data.count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 2 {
            let largeCell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as! LargeCell
            largeCell.app = appCategories?.appCategory[indexPath.item]
            return largeCell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppCategoryCell
        cell.app = appCategories?.appCategory[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 2 {
            return CGSize(width: view.frame.width, height: 180)
        }
        return CGSize(width: view.frame.width, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
}

