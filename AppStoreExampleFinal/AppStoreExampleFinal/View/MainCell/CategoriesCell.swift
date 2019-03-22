//
//  CategoriesCell.swift
//  AppStoreExampleFinal
//
//  Created by 배지호 on 20/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    var app: Apps? {
        didSet {
            if let imageName = app?.imageName {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "frozen")
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 16
        v.layer.masksToBounds = true
        return v
    }()
    
    let title: UILabel = {
        let view = UILabel()
        view.text = "testtesttesttesttesttesttesttesttesttesttesttest"
        view.numberOfLines = 2
        view.font = UIFont.boldSystemFont(ofSize: 14)
        return view
    }()
    
    let themeName: UILabel = {
        let view = UILabel()
        view.text = "test.test"
        view.font = UIFont.systemFont(ofSize: 14)
        return view
    }()
    
    let price: UILabel = {
        let view = UILabel()
        view.text = "3.00"
        view.font = UIFont.systemFont(ofSize: 14)
        return view
    }()
    
    func setupView() {
        
        [imageView, title, themeName, price].forEach { (view) in
            self.addSubview(view)
        }
        
        imageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: title.topAnchor, padding: .init(top: 0, left: 0, bottom: 10, right: 0), size: .init(width: 50, height: 100))
        title.anchor(top: imageView.bottomAnchor, leading: imageView.leadingAnchor, trailing: imageView.trailingAnchor, bottom: themeName.topAnchor, padding: .zero, size: .zero)
        themeName.anchor(top: title.bottomAnchor, leading: imageView.leadingAnchor, trailing: imageView.trailingAnchor, bottom: price.topAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 20))
        price.anchor(top: themeName.bottomAnchor, leading: imageView.leadingAnchor, trailing: imageView.trailingAnchor, bottom: self.bottomAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .zero)
    }
}
