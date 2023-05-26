//
//  WebView.swift
//  HNBrowserSn
//
//  Created by Shen, Sharon on 5/8/23.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable
{
    let urlString: String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url_string = urlString {
            let request = URLRequest(url: URL(string: url_string)!)
            uiView.load(request)
        }
    }
}
