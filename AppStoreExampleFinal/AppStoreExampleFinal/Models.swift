//
//  Models.swift
//  AppStoreExampleFinal
//
//  Created by 배지호 on 21/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit



struct AppCategory: Decodable {
    var bannerCategory: Categories
    var appCategory: [Categories]
    
    private enum CodingKeys: String, CodingKey {
        case appCategory = "categories"
        case bannerCategory
    }
}

struct Categories: Decodable {
    var name: String
    var apps: [Apps]
    var type: String
    
    static func fetchData(_ completionHandler: @escaping (AppCategory) -> ()) {
        let url = "https://api.letsbuildthatapp.com/appstore/featured"
        guard let urlString = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: urlString) { (data, response, error) in
            guard let data = data else {return}
            do {
                let modelData = try JSONDecoder().decode(AppCategory.self, from: data)
                DispatchQueue.main.async(execute: {
                    completionHandler(modelData)
                })
            } catch {
                
            }
        }.resume()
    }
    
}

struct Apps: Decodable {
    var id: Int?
    var name: String?
    var category: String?
    var price: Float?
    var imageName: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case category = "Category"
        case price = "Price"
        case imageName = "ImageName"
    }
}

//Id": 2,
//"Name": "Telepaint",
//"Category": "Games",
//"Price": 2.99,
//"ImageName": "telepaint"
