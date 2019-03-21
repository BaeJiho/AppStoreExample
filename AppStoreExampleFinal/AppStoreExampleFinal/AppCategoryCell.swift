//
//  AppCategoryCell.swift
//  AppStoreExampleFinal
//
//  Created by 배지호 on 20/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class AppCategoryCell: UICollectionViewCell,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let categoriesCellId = "categoriesCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let appCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sectionTitle: UILabel = {
        let view = UILabel()
        view.text = "testFont"
        view.font = UIFont.boldSystemFont(ofSize: 16)
        return view
    }()
    
    func setupView() {
        
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        appCollectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: categoriesCellId)
        
        addSubview(appCollectionView)
        addSubview(sectionTitle)
        //Anchor
        appCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        appCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        appCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        appCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        sectionTitle.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sectionTitle.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": appCollectionView]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": appCollectionView]))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: categoriesCellId, for: indexPath) as! CategoriesCell
        return categoriesCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 32)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}
