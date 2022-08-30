//
//  TabBarController.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/08/29.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieRankViewController = UINavigationController(rootViewController: MovieRankViewController())
        movieRankViewController.tabBarItem = UITabBarItem(
            title: "영화 순위",
            image: UIImage(systemName: "film"),
            selectedImage: UIImage(systemName: "film.fill")
        )
        
        let findMovieViewController = UINavigationController(rootViewController: FindMovieViewController())
        findMovieViewController.tabBarItem = UITabBarItem(
            title: "영화 찾기",
            image: UIImage(systemName: "magnifyingglass.circle"),
            selectedImage: UIImage(systemName: "magnifyingglass.circle.fill")
        )
        
        let findCinemaViewController = UINavigationController(rootViewController: FindCinemaViewController())
        findCinemaViewController.tabBarItem = UITabBarItem(
            title: "영화관 찾기",
            image: UIImage(systemName: "location"),
            selectedImage: UIImage(systemName: "location.fill")
        )
        
        viewControllers = [movieRankViewController, findMovieViewController, findCinemaViewController]
    }
}
