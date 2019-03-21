//
//  ShotCell.swift
//  AppStoreExample
//
//  Created by 배지호 on 20/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit
class ShotCell: BaseCell {
    
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "frozen")
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 14
        return view
    }()
    
    override func setupView() {
        backgroundColor = .clear
        layer.masksToBounds = true
        addSubview(imageView)
        //
        addConstraintwithVisualFormat(Formet: "H:|[v0]|", Views: imageView)
        addConstraintwithVisualFormat(Formet: "V:|[v0]|", Views: imageView)
        
    }
}
