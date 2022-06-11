//
//  WelcomeViewController.swift
//  MusicApp
//
//  Created by Ruslan on 08.06.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Subviews
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign in with Spotify", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureSignInButtonFrame()
    }
    
    // MARK: - Methods
    private func configureViews() {
        title = "Welcome"
        view.backgroundColor = .systemGreen
        
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    private func configureSignInButtonFrame() {
        signInButton.frame = CGRect(x: 20,
                                    y: view.height - 50 - view.safeAreaInsets.bottom,
                                    width: view.width - 40,
                                    height: 50)
    }
    
    @objc
    private func didTapSignIn() {
        let vc = AuthViewController()
        vc.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func handleSignIn(success: Bool) {
        // log user in or yell at them for error
    }
}
