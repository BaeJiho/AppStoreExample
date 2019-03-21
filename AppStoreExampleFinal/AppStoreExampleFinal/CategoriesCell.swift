//
//  CategoriesCell.swift
//  AppStoreExampleFinal
//
//  Created by 배지호 on 20/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
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
        v.contentMode = .scaleAspectFit
        v.layer.cornerRadius = 16
        v.layer.masksToBounds = true
        return v
    }()
    
    let title: UILabel = {
        let view = UILabel()
        view.text = "test"
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
        addSubview(imageView)
        addSubview(title)
        addSubview(themeName)
        addSubview(price)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        title.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        themeName.frame = CGRect(x: 0, y: frame.width + 30, width: frame.width, height: 20)
        price.frame = CGRect(x: 0, y: frame.width + 45, width: frame.width, height: 20)
        
    }
}
