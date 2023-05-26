//
//  ContentView.swift
//  HNBrowserSn
//
//  Created by Shen, Sharon on 5/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var sourceManager = SourceManager()

    var body: some View {
        NavigationView {
            List(sourceManager.newsItems, rowContent: { message in
                NavigationLink(destination: DetailView(urlString: message.url)) {
                    Text(String(message.points))
                    Text(message.title)
                }
            })
            .navigationBarTitle("Hacker News")
        }
        .onAppear(){
            sourceManager.readData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




