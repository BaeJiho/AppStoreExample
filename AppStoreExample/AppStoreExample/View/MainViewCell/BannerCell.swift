//
//  BannerCell.swift
//  AppStoreExample
//
//  Created by 배지호 on 19/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class BannerCell: AppListViewCell {
    override func setupView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 0
        addSubview(imageView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": imageView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": imageView]))
    }
}

