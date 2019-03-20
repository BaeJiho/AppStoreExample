//
//  AppListViewCell.swift
//  AppStoreExample
//
//  Created by 배지호 on 17/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class AppListViewCell: UICollectionViewCell {
    
    var apps: App? {
        didSet {
            guard let data = apps else {return}
            print(apps?.imageName)
            title.text = data.name
            categoryTitle.text = data.category
            if data.price == nil {
                priceTitle.isHidden = true
            } else {
                priceTitle.isHidden = false
            }
            priceTitle.text = "\(data.price ?? 0)"
            imageView.image = UIImage(named: data.imageName ?? "")
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
        let view = UIImageView()
        view.image = UIImage(named: "frozen")
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "Disney Build It: Frozen"
        title.font = UIFont.systemFont(ofSize: 14)
        title.numberOfLines = 2
        return title
    }()
    
    let categoryTitle: UILabel = {
        let categoryTitle = UILabel()
        categoryTitle.text = "Entertainment"
        categoryTitle.font = UIFont.systemFont(ofSize: 14)
        categoryTitle.textColor = UIColor.darkGray
        return categoryTitle
    }()
    
    let priceTitle: UILabel = {
        let priceTitle = UILabel()
        priceTitle.text = "3,000 won"
        priceTitle.font = UIFont.systemFont(ofSize: 14)
        priceTitle.textColor = UIColor.darkGray
        return priceTitle
    }()
    
    func setupView() {
        backgroundColor = .clear
        addSubview(imageView)
        addSubview(title)
        addSubview(categoryTitle)
        addSubview(priceTitle)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        title.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        categoryTitle.frame = CGRect(x: 0, y: frame.width + 38, width: frame.width, height: 20)
        priceTitle.frame = CGRect(x: 0, y: frame.width + 55, width: frame.width, height: 20)
    }

}
