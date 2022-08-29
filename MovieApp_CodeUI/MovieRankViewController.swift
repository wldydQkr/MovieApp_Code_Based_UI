//
//  MovieRankViewController.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/08/29.
//

import UIKit
import SnapKit

final class MovieRankViewController: UIViewController {
    
    let searchController = UISearchController()
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(
            MovieRankCollectionViewCell.self,
            forCellWithReuseIdentifier: MovieRankCollectionViewCell.identifier
        )
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupSearchBar()
        setupViews()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "박스오피스 순위"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func setupSearchBar() {
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    func setupViews() {
        [collectionView]
            .forEach { view.addSubview($0) }
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension MovieRankViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 16.0
        let width: CGFloat = (collectionView.frame.width - spacing * 3) / 2
        return CGSize(width: width, height: 210.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 16.0
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
}

extension MovieRankViewController: UICollectionViewDelegate {
    
}

extension MovieRankViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MovieRankCollectionViewCell.identifier,
            for: indexPath) as? MovieRankCollectionViewCell
        
        cell?.update()
        
        return cell ?? UICollectionViewCell()
    }
    
}
