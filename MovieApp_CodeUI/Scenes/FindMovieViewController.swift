//
//  FindMovieViewController.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/08/30.
//

import UIKit
import SnapKit

final class FindMovieViewController: UIViewController {
    
//    let userDefaultsManager: UserDefaultsManager
    
    private var likedMovie: [Movie] = []
    
    private var currentMovieSearchResult: [Movie] = []
    
    private lazy var searchResultTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupNavigationBar()
//        setupViews()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "영화 찾기 🔎"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController()
        
        searchController.searchBar.placeholder = "영화이름을 입력 해 주세요!"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
        
    }
    
    func setupViews() {
        view.addSubview(searchResultTableView)

        searchResultTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension FindMovieViewController: UISearchBarDelegate {
    // SearchBar가 활성화 될 떄
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchResultTableView.reloadData()
        searchResultTableView.isHidden = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchResultTableView.isHidden = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchResultTableView.isHidden = true
    }
}

extension FindMovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension FindMovieViewController: UITableViewDelegate {

}
