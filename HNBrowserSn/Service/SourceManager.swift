//
//  SourceManager.swift
//  HNBrowserSn
//
//  Created by Shen, Sharon on 5/8/23.
//

import Foundation


class SourceManager: ObservableObject{
    
    @Published var newsItems = [NewsItem]()
    
    func readData(){
        let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page")
        let session = URLSession.shared //URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            guard let safe_data = data, error == nil else{
                print(error ?? "nil")
                return
            }

            let decoder = JSONDecoder()

            do{
                let page = try decoder.decode(NewsPage.self, from: safe_data)
                DispatchQueue.main.async {
                    self.newsItems = page.hits
                }
            }
            catch let parseError {
                print(parseError)
            }
        }

        task.resume()
    }
}
