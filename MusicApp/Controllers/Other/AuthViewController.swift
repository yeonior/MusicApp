//
//  AuthViewController.swift
//  MusicApp
//
//  Created by Ruslan on 08.06.2022.
//

import UIKit
import WebKit

final class AuthViewController: UIViewController {
    
    // MARK: - Subviews
    private let webView: WKWebView = {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureWebViewFrame()
    }
    
    // MARK: - Methods
    private func configureViews() {
        title = "Sign in"
        view.backgroundColor = .systemBackground
        
        view.addSubview(webView)
        webView.navigationDelegate = self
    }
    
    private func configureWebViewFrame() {
        webView.frame = view.bounds
    }
}

// MARK: - WKNavigationDelegate
extension AuthViewController: WKNavigationDelegate {
    
}
