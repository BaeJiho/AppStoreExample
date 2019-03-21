//
//  ScreenShotCell.swift
//  AppStoreExample
//
//  Created by 배지호 on 19/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class ScreenShotCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let detailShotCellId = "detailShotCellId"
    
    var app: App? {
        didSet {
            self.screenShotView.reloadData()
        }
    }
    
    let screenShotView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        return view
    }()
    
    let bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    override func setupView() {
        super.setupView()
        addSubview(screenShotView)
        addSubview(bottomLine)
        screenShotView.delegate = self
        screenShotView.dataSource = self
        
        screenShotView.register(ShotCell.self, forCellWithReuseIdentifier: detailShotCellId)
        addConstraintwithVisualFormat(Formet: "H:|[v0]|", Views: screenShotView)
        addConstraintwithVisualFormat(Formet: "H:|[v0]|", Views: bottomLine)
        addConstraintwithVisualFormat(Formet: "V:|[v0][v1(1)]|", Views: screenShotView, bottomLine)
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = app?.screenShots?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let shotCell = collectionView.dequeueReusableCell(withReuseIdentifier: detailShotCellId, for: indexPath) as! ShotCell
        if let name = app?.screenShots?[indexPath.item] {
            shotCell.imageView.image = UIImage(named: name)
        }
        return shotCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 28)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
}


