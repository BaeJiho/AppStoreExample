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
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: detailCellId, for: indexPath) as! DetailCell
        header.app = app
        return header
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let shotCell = collectionView.dequeueReusableCell(withReuseIdentifier: shotCellId, for: indexPath) as! ScreenShotCell
        shotCell.app = app
        return shotCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 180)
    }
}
