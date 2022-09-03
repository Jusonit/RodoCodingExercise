//
//  LandingView.swift
//  RodoCodingExercise
//
//  Created by Junior Figuereo on 9/3/22.
//

import UIKit

class LandingView: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .black
        setupViews()
    }
    
    func setupViews() {
        viewControllers = [
        ]
        
        
        tabBar.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }

}
