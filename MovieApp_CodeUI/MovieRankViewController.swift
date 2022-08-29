//
//  MovieRankViewController.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/08/29.
//

import UIKit

final class MovieRankViewController: UIViewController {
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupSearchBar()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "박스오피스 순위"
        
    }
    
    func setupSearchBar() {
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
}
