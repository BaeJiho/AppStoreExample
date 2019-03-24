//
//  HeaderInfoCell.swift
//  AppStoreExampleFinal
//
//  Created by 배지호 on 22/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class HeaderInfoCell: CategoriesCell {
    override func setupView() {
        addSubview(imageView)
        imageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor, padding: .zero, size: .zero)
    }
}
