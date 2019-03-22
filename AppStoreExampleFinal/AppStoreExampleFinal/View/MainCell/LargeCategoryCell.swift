//
//  LargeCategoryCell.swift
//  AppStoreExampleFinal
//
//  Created by 배지호 on 21/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class LargeCategoryCell: CategoriesCell {
    
    override func setupView() {
        addSubview(imageView)
        
        imageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor, padding: .zero, size: .zero)
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": imageView]))
//
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": imageView]))
    }
}
