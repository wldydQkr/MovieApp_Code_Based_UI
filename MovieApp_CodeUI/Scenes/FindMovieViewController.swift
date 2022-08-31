//
//  FindMovieViewController.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/08/30.
//

import UIKit
import SnapKit

final class FindMovieViewController: UIViewController {
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupSearchBar()
        setupNavigationBar()
    }
    
    func setupSearchBar() {
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    func setupNavigationBar() {
        navigationItem.title = "영화 찾기 🔎"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}
