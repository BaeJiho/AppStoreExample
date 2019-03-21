//
//  DetailViewController.swift
//  AppStoreExample
//
//  Created by 배지호 on 19/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit


class DetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let detailCellId = "detailCellId"
    private let shotCellId = "shotCellId"
    private let descriptionCellId = "descriptionCellId"
    var app: App? {
        didSet {
            navigationItem.title = app?.name
            //처음 app내부에 screenshots에 imageName에 대한 정보가 없으니, 아래 URLSession을 실행하게 되며, 그 이후 정보가 담겨져 있기에 리턴
            if app?.screenShots != nil {return}
            if let id = app?.id {
                print(id)
                let url = "https://api.letsbuildthatapp.com/appstore/appdetail?id=\(id)"
                guard let urlString = URL(string: url) else {return}
                URLSession.shared.dataTask(with: urlString) { (data, response, error) in
                    guard let data = data else {return}
                    do {
                        let a = try JSONDecoder().decode(App.self, from: data)
                        print("???? : \(a)")
                        self.app = a
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    } catch {
                        
                    }
                }.resume()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.register(DetailCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: detailCellId)
        collectionView.register(ScreenShotCell.self, forCellWithReuseIdentifier: shotCellId)
        collectionView.register(DetailDescriptionCell.self, forCellWithReuseIdentifier: descriptionCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: detailCellId, for: indexPath) as! DetailCell
        header.app = app
        return header
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 1 {
            let descriptionCell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionCellId, for: indexPath) as! DetailDescriptionCell
            descriptionCell.textView.attributedText = attributtedText()
            return descriptionCell
        }
        let shotCell = collectionView.dequeueReusableCell(withReuseIdentifier: shotCellId, for: indexPath) as! ScreenShotCell
        shotCell.app = app
        return shotCell
    }
    private func attributtedText() -> NSAttributedString {
        let text = NSMutableAttributedString(string: "Description\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
        if let descriptionText = app?.description {
            text.append(NSAttributedString(string: descriptionText, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]))
        }
        return text
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 180)
    }
}
