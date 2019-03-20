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
            guard let imageName = app?.imageName else {return}
            guard let name = app?.name else {return}
            imageView.image = UIImage(named: imageName)
            title.text = name
            
            if let price = app?.price {
                button.setTitle("$\(price)", for: .normal)
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
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.layer.borderColor = UIColor(red: 0, green: 129/255, blue: 250/255, alpha: 1).cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    let bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
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
        addSubview(bottomLine)
        
        //autoLayout
        addConstraintwithVisualFormat(Formet: "H:|-14-[v0(100)]-8-[v1]-40-|", Views: imageView,title)
        addConstraintwithVisualFormat(Formet: "V:|-14-[v0(100)]", Views: imageView)
        addConstraintwithVisualFormat(Formet: "V:|-14-[v0(20)]|", Views: title)
        
        addConstraintwithVisualFormat(Formet: "H:|-14-[v0]-14-|", Views: segment)
        addConstraintwithVisualFormat(Formet: "V:[v0(34)]-8-|", Views: segment)
        
        addConstraintwithVisualFormat(Formet: "H:[v0(60)]-40-|", Views: button)
        addConstraintwithVisualFormat(Formet: "V:[v0(32)]-54-|", Views: button)
        
        addConstraintwithVisualFormat(Formet: "H:|[v0]|", Views: bottomLine)
        addConstraintwithVisualFormat(Formet: "V:[v0(0.5)]|", Views: bottomLine)
        
        

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

