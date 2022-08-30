//
//  MovieRankViewController.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/08/29.
//

import UIKit
import SnapKit

final class MovieRankViewController: UIViewController {
    
    var movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=ff9c16a03f346ef0d94dad367d05269c&targetDt="
    
    var movieData: MovieData?
    
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
        
        movieURL += makeYesterdayString()
        
        getData()
    }
    
    func makeYesterdayString() -> String {
        
        let y = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        
        let dateF = DateFormatter()
        
        dateF.dateFormat = "yyyyMMdd"
        
        let day = dateF.string(from: y)
        
        return day
    }
    
    func getData() {
        
        guard let url = URL(string: movieURL) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            guard let JSONData = data else { return }
            
            let dataString = String(data: JSONData, encoding: .utf8)
            print(dataString!)
            let decoder = JSONDecoder()
            
            do {
                let decodeData = try decoder.decode(MovieData.self, from: JSONData)
//                print(decodeData.movieData?.boxOfficeResult.dailyBoxOfficeList[0].movieNm)
//                print(decodeData.movieData?.boxOfficeResult.dailyBoxOfficeList[0].audiCnt)
                self.movieData = decodeData
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }

}

//MARK: setup() 메서드
extension MovieRankViewController {
    
    func setupNavigationBar() {
        navigationItem.title = "일별 박스오피스 😎"
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

//MARK: CollectionViewDelegate 메서드
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

//MARK: CollectionViewDataSource 메서드
extension MovieRankViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MovieRankCollectionViewCell.identifier,
            for: indexPath) as? MovieRankCollectionViewCell
        
        cell?.titleLabel.text = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieNm
        cell?.userRatingLabel.text = "순위: \(movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].rnum ?? "0")"
        
        cell?.update()
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MovieDetailViewController()
        present(vc, animated: true)
    }
    
}
