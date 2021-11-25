// WebView.swift

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{

    var url: URL?     // optional, if absent, one of below search servers used
    @Binding var reload: Bool

    private let urls = [URL(string: "https://google.com/")!, URL(string: "https://www.sl.se")!]
    private let webview = WKWebView()

    fileprivate func loadRequest(in webView: WKWebView) {
        if let url = url {
            webView.load(URLRequest(url: url))
        } else {
            let index = Int(Date().timeIntervalSince1970) % 2
            print("load: \(urls[index].absoluteString)")
            webView.load(URLRequest(url: urls[index]))
        }
    }

    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        loadRequest(in: webview)
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        if reload {
            loadRequest(in: uiView)
            DispatchQueue.main.async {
                self.reload = false     // must be async
            }
        }
    }
}