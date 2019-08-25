//
//  ViewController.swift
//  webviewdemo
//
//  Created by mic-student5 on 8/25/19.
//  Copyright © 2019 mic. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate, WKNavigationDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var backwardBtn: UIBarButtonItem!
    @IBOutlet weak var forwardBtn: UIBarButtonItem!
    @IBOutlet weak var refreshwardBtn: UIBarButtonItem!
    
    
    @IBAction func goBackWard(_ sender: UIBarButtonItem){
        webView.goBack()
    }
    
    @IBAction func goForward(_ sender: UIBarButtonItem){
        webView.goForward()
    }
    
    @IBAction func goRefresh(_ sender: UIBarButtonItem){
        refreshwardBtn.isEnabled = false
        webView.reload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self //
        webView.navigationDelegate = self //
        loadURL(urlString: "google.com")
        
        backwardBtn.isEnabled = false
        forwardBtn.isEnabled = false
        refreshwardBtn.isEnabled = false
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        
        searchBar.resignFirstResponder()
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print(searchText)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        print("didendediting")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        print("btnclicked")
    }
    
    func loadURL(urlString:String){
        
        var newURL = urlString.hasPrefix("https://") ? urlString : "https://" + urlString
        
        //newURL = newURL.lowercased()
        
        if let myUrl = URL(string: newURL)
        {
            let request = URLRequest(url: myUrl)
            webView.load(request)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        backwardBtn.isEnabled = webView.canGoBack
        forwardBtn.isEnabled = webView.canGoForward
        refreshwardBtn.isEnabled = true
    }
    
    

}

