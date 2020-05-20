//
//  ViewController.swift
//  WKWebViewSample
//
//  Created by kazuya on 2020/05/21.
//  Copyright © 2020 K.Hatano. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView_: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
        loadHtml()
    }
    
    func setupWebView() {
        webView_.navigationDelegate = self      // WKNavigationDelegate
        webView_.uiDelegate = self              // WKUIDelegate
    }
    
    func loadHtml() {
        guard let path = Bundle.main.path(forResource: "index", ofType: "html", inDirectory: "WebPage") else {
            print("error: index.html not found.")
            return
        }
        
        let localHtmlURL = URL(fileURLWithPath: path)
        webView_.loadFileURL(localHtmlURL, allowingReadAccessTo: localHtmlURL)
    }

}

extension ViewController : WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Javascriptに渡す値
        let param: String = "{\"title\": \"Hello World!\"}"
        // Javascript側で実行する関数
        let execJsFunc: String = "test(JSON.stringify(\(param)));"
        webView.evaluateJavaScript(execJsFunc, completionHandler: { (object, error) -> Void in
            // jsの関数実行結果
            // js側で戻り値を返すこともできる
        })
    }
}

extension ViewController: WKUIDelegate {
    
}

