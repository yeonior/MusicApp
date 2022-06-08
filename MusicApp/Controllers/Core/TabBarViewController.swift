//
//  TabBarViewController.swift
//  MusicApp
//
//  Created by Ruslan on 08.06.2022.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Methods
    private func configureUI() {
        
        // view controllers
        let firstVC = HomeViewController()
        let secondVC = SearchViewController()
        let thirdVC = LibraryViewController()
        
        firstVC.title = "Browse"
        secondVC.title = "Search"
        thirdVC.title = "Library"
        
        firstVC.navigationItem.largeTitleDisplayMode = .always
        secondVC.navigationItem.largeTitleDisplayMode = .always
        thirdVC.navigationItem.largeTitleDisplayMode = .always
        
        // navigation controllers
        let firstNav = UINavigationController(rootViewController: firstVC)
        let secondNav = UINavigationController(rootViewController: secondVC)
        let thirdNav = UINavigationController(rootViewController: thirdVC)
        
        firstNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        secondNav.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        thirdNav.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 3)
        
        firstNav.navigationBar.prefersLargeTitles = true
        secondNav.navigationBar.prefersLargeTitles = true
        thirdNav.navigationBar.prefersLargeTitles = true
        
        setViewControllers([firstNav, secondNav, thirdNav], animated: false)
    }
}
