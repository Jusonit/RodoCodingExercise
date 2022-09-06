//
//  HomeViewController.swift
//  RodoCodingExercise
//
//  Created by Junior Figuereo on 9/3/22.
//

import UIKit

class LandingView: UITabBarController {
    
    let homeVC = HomeViewController()
    let messageVC = MessageViewController()
    let favoritesVC = FavoritesViewController()
    let uploadsVC = UploadsViewController()
    let settingsVC = SettingsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupTabBar()
    }
    
    func setupTabBar() {
        
        viewControllers = [
            createNavController(for: homeVC, title: nil, image: UIImage(named: "house")!),
            createNavController(for: messageVC, title: nil, image: UIImage(named: "message")!),
            createNavController(for: favoritesVC, title: nil, image: UIImage(named: "heart")!),
            createNavController(for: uploadsVC, title: nil, image: UIImage(named: "square.and.arrow.up")!),
            createNavController(for: settingsVC, title: nil, image: UIImage(named: "gear")!)
        ]
        
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .black
        tabBar.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        tabBar.isTranslucent = false
        
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String?, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        if let _ = title {
            navController.tabBarItem.title = title
            rootViewController.navigationItem.title = title
            navController.navigationBar.prefersLargeTitles = true
        }
        navController.tabBarItem.image = image
        return navController
    }
}

