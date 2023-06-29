//
//  YoutubeEmbed.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import Foundation
import WebKit
import SwiftUI

struct YoutubeView: UIViewRepresentable {
    
    let videoId: String
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else {
            return
        }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
    
}
