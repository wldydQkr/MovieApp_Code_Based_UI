//
//  MovieDetailViewController.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/08/30.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .secondarySystemBackground
        imageView.layer.cornerRadius = 12.0
        
        imageView.image = UIImage(systemName: "film")
        
        return imageView
    }()
    
    private var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    
        //TODO: 예매하기 버튼 구현하기
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let titleLabelContentsStackViwe = MovieContentStackView(title: "제목", contents: "시발")
        let userRatingContentsStackView = MovieContentStackView(title: "평점", contents: "10.0")
        let actorContentsStackView = MovieContentStackView(title: "배우", contents: "박지용")
        let directorContentsStackView = MovieContentStackView(title: "감독", contents: "제임스 박")
        let pubDateContentsStackView = MovieContentStackView(title: "개봉일", contents: "2022년 8월 30일")
        let audiAccumulateContentsStackView = MovieContentStackView(title: "누적", contents: "100,000,000명")
        let audiCountContentsStackView = MovieContentStackView(title: "어제", contents: "100,000명")
        
        let contentsStackView = UIStackView()
        contentsStackView.axis = .vertical
        contentsStackView.spacing = 8.0
        
        [
            titleLabelContentsStackViwe,
            userRatingContentsStackView,
            actorContentsStackView,
            directorContentsStackView,
            pubDateContentsStackView,
            audiAccumulateContentsStackView,
            audiCountContentsStackView
        ].forEach { contentsStackView.addArrangedSubview($0) }
        
        [imageView, contentsStackView]
            .forEach { view.addSubview($0) }
        
        let inset: CGFloat = 16.0
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
            $0.trailing.equalToSuperview().inset(inset)
            $0.height.equalTo(imageView.snp.width)
        }
        
        contentsStackView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.leading)
            $0.trailing.equalTo(imageView.snp.trailing)
            $0.top.equalTo(imageView.snp.bottom).offset(inset)
        }
    }
    
}

protocol MovieDetailProtocol: AnyObject {
    
}
