//
//  Models.swift
//  AppStoreExample
//
//  Created by 배지호 on 18/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import Foundation


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
    var apps: [App]
    var type: String
    
    static func fetchesAppData(_ completionHandler: @escaping (AppCategory) -> ()) {
        let url = "https://api.letsbuildthatapp.com/appstore/featured"
        guard let urlString = URL(string: url) else {return}
        URLSession.shared.dataTask(with: urlString) { (data, response, error) in
            guard let data = data else {return}
            do {
                let categoriesData = try JSONDecoder().decode(AppCategory.self, from: data)
                DispatchQueue.main.async(execute: {
                    completionHandler(categoriesData)
                })
            } catch {
                
            }
        }.resume()
    }
}


struct App: Decodable {
    var id: Int?
    var name: String?
    var category: String?
    var price: Float?
    var imageName: String?
    var screenShots: [String]?
    var description: String?
    var appInformation: [Info]?
    
    private enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case category = "Category"
        case price = "Price"
        case imageName = "ImageName"
        case screenShots = "Screenshots"
        case description = "description"
        case appInformation = "appInformation"
    }
}

struct Info: Decodable {
    var name: String?
    var value: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
    }
}
