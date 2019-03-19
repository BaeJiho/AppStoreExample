//
//  DetailCell.swift
//  AppStoreExample
//
//  Created by 배지호 on 19/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class DetailCell: BaseCell {
    var app: App? {
        didSet {
            if let imageName = app?.imageName {
                imageView.image = UIImage(named: imageName)
            }
            if let name = app?.name {
                title.text = name
            }
        }
    }
//
//
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    let title: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 16)
        name.numberOfLines = 2
        return name
    }()
    
    let button: UIButton = {
       let btn = UIButton(type: .system)
        btn.setTitle("BUY", for: .normal)
        btn.layer.borderColor = UIColor(red: 0, green: 129/255, blue: 250/255, alpha: 1).cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    let segment: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["one", "two", "three"])
        sc.tintColor = .darkGray
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    
    
    override func setupView() {
        super.setupView()
        
        addSubview(imageView)
        addSubview(segment)
        addSubview(title)
        addSubview(button)
        
        addConstraintwithVisualFormat(Formet: "H:|-14-[v0(100)]-8-[v1]-40-|", Views: imageView,title)
        addConstraintwithVisualFormat(Formet: "V:|-14-[v0(100)]", Views: imageView)
        addConstraintwithVisualFormat(Formet: "V:|-14-[v0(20)]|", Views: title)
        
        addConstraintwithVisualFormat(Formet: "H:|-40-[v0]-40-|", Views: segment)
        addConstraintwithVisualFormat(Formet: "V:[v0(34)]-8-|", Views: segment)
        
        addConstraintwithVisualFormat(Formet: "H:[v0(60)]-40-|", Views: button)
        addConstraintwithVisualFormat(Formet: "V:[v0(32)]-54-|", Views: button)
        
        

    }
}

extension UIView {
    func addConstraintwithVisualFormat(Formet: String, Views: UIView...) {
        var viewDictionary: [String: UIView] = [:]
        for (index, view) in Views.enumerated() {
            var key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: Formet, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
    }
}

