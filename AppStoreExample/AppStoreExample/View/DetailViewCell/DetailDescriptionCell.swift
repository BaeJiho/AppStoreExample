//
//  DetailDescriptionCell.swift
//  AppStoreExample
//
//  Created by 배지호 on 20/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class DetailDescriptionCell: BaseCell {
    let textView: UITextView = {
       let view = UITextView()
        view.text = "ddddd"
        return view
    }()
    override func setupView() {
        super.setupView()
        
        addSubview(textView)
        
        addConstraintwithVisualFormat(Formet: "H:|[v0]|", Views: textView)
        addConstraintwithVisualFormat(Formet: "V:|[v0]|", Views: textView)
    }
}
