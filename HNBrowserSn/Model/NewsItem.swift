//
//  NewsItem.swift
//  HNBrowserSn
//
//  Created by Shen, Sharon on 5/8/23.
//

import Foundation

class NewsPage: Decodable {
    let hits: [NewsItem]
}

class NewsItem: Decodable, Identifiable {
    var id: String {
        return objectID
    }

    let objectID:String
    let url: String?
    let title: String
    let points: Int

}
