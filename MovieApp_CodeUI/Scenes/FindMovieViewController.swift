//
//  FindMovieViewController.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/08/30.
//

import UIKit
import SnapKit

final class FindMovieViewController: UIViewController {
    
    private let searchController = UISearchController()
    
    private lazy var searchResultTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupSearchBar()
        setupNavigationBar()
        setupViews()
        updateSearchTableView(isHidden: true)
    }
    
    func setupSearchBar() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.delegate = self
        navigationItem.searchController = searchController
    }
    
    func setupNavigationBar() {
        navigationItem.title = "영화 찾기 🔎"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func setupViews() {
        [searchResultTableView]
            .forEach { view.addSubview($0) }
        
        searchResultTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        searchResultTableView.isHidden = true
    }
    
    func updateSearchTableView(isHidden: Bool) {
        searchResultTableView.isHidden = isHidden
        searchResultTableView.reloadData()
    }
}

extension FindMovieViewController: UISearchControllerDelegate {
    
}

extension FindMovieViewController: UITableViewDelegate {
    
}

extension FindMovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
