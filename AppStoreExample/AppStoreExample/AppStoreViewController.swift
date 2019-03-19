//
//  ViewController.swift
//  AppStoreExample
//
//  Created by 배지호 on 15/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class AppStoreViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellId = "cellId"
    private let headCellId = "headCellId"
    private let LargeCategorycellId = "LargeCategorycellId"
    
    var categories: AppCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        navigationItem.title = "App Store"
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HeadCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headCellId)
        collectionView.register(LargeCategoryCell.self, forCellWithReuseIdentifier: LargeCategorycellId)
        Categories.fetchesAppData { (response) in
            print(response.bannerCategory.apps)
            self.categories = response
            self.collectionView.reloadData()
        }
    }
    func showDetailView(app: App) {
        let layout = UICollectionViewFlowLayout()
        let detailVC = DetailViewController(collectionViewLayout: layout)
        detailVC.app = app
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if indexPath.item == 2 {
            let largeCell = collectionView.dequeueReusableCell(withReuseIdentifier: LargeCategorycellId, for: indexPath) as! LargeCategoryCell
            largeCell.categories = categories?.appCategory[indexPath.item]
            largeCell.detailViewController = self
            return largeCell
        }
        
        let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCollectionViewCell
        categoryCell.categories = categories?.appCategory[indexPath.item]
        categoryCell.vc = self
        return categoryCell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categories?.appCategory.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headCellId, for: indexPath) as! HeadCell
        header.categories = categories?.bannerCategory
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 2 {
            return CGSize(width: view.frame.width, height: 160)
        }
        return CGSize(width: view.frame.width, height: 230)
    }
}



