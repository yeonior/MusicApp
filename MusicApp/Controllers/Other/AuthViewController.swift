//
//  AuthViewController.swift
//  MusicApp
//
//  Created by Ruslan on 08.06.2022.
//

import UIKit
import WebKit

final class AuthViewController: UIViewController {
    
    // MARK: - Properties
    public var completionHandler: ((Bool) -> Void)?
    
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
        webViewLoad()
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
    
    private func webViewLoad() {
        guard let url = AuthManager.shared.signInURL else { return }
        webView.load(URLRequest(url: url))
    }
}

// MARK: - WKNavigationDelegate
extension AuthViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else { return }
        // exchange the code for access token
        let component = URLComponents(string: url.absoluteString)
        guard let code = component?.queryItems?.first(where: { $0.name == "code" })?.value else { return }
        print(code)
    }
}
