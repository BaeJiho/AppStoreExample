//
//  DetailViewController.swift
//  AppStoreExample
//
//  Created by 배지호 on 19/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit


class DetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let detailCellId = "detailCellId"
    
    var app: App? {
        didSet {
            navigationItem.title = app?.name
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.register(DetailCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: detailCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: detailCellId, for: indexPath) as! DetailCell
        header.app = app
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 170)
    }
}
