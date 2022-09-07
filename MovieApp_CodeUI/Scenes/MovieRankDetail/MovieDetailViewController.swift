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
        
        imageView.image = UIImage(named: "topgun")
        
        return imageView
    }()
    
    var cgvButton: UIButton = {
        let button = UIButton()
        button.setTitle(" CGV 예매 ", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.systemIndigo, for: .normal)
        button.layer.cornerRadius = 8.0
        
        return button
    }()
    
    var megaboxButton: UIButton = {
        let button = UIButton()
        button.setTitle(" 메가박스 예매 ", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.systemIndigo, for: .normal)
        button.layer.cornerRadius = 8.0
        
        return button
    }()
    
    var lotteButton: UIButton = {
        let button = UIButton()
        button.setTitle(" 롯데시네마 예매 ", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.systemIndigo, for: .normal)
        button.layer.cornerRadius = 8.0
        
        return button
    }()
    
    private var movie: Movie
    
    private var indexPath: Int
    
    init(movie: Movie, indexPath: Int) {
        self.movie = movie
        self.indexPath = indexPath
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    
        //TODO: 예매하기 버튼 구현하기
        //TODO: Naver 영화 api로 바꾸기
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let titleLabelContentsStackViwe = MovieContentStackView(
            title: "제목",
            contents: movie.boxOfficeResult.dailyBoxOfficeList[indexPath].movieNm
        )
//        let userRatingContentsStackView = MovieContentStackView(
//            title: "평점",
//            contents: "10.0"
//        )
//        let actorContentsStackView = MovieContentStackView(
//            title: "배우",
//            contents: "박지용"
//        )
//        let directorContentsStackView = MovieContentStackView(
//            title: "감독",
//            contents: "제임스 박"
//        )
        let pubDateContentsStackView = MovieContentStackView(
            title: "개봉일",
            contents: movie.boxOfficeResult.dailyBoxOfficeList[indexPath].openDt
        )
        let audiAccumulateContentsStackView = MovieContentStackView(
            title: "누적",
            contents: "\(movie.boxOfficeResult.dailyBoxOfficeList[indexPath].audiAcc)명"
        )
        let audiCountContentsStackView = MovieContentStackView(
            title: "어제",
            contents: "\(movie.boxOfficeResult.dailyBoxOfficeList[indexPath].audiCnt)명"
        )
        
//        if let aCnt = movie.boxOfficeResult.dailyBoxOfficeList[indexPath].audiCnt {
//
//                 let numF = NumberFormatter()
//
//                 numF.numberStyle = .decimal
//
//                 let aCount = Int(aCnt)!
//
//                 let result = numF.string(for: aCount)!+"명"
//
//             }
        
        let contentsStackView = UIStackView()
        contentsStackView.axis = .vertical
        contentsStackView.spacing = 8.0
        
        let ticketingStackView = UIStackView()
        ticketingStackView.axis = .horizontal
        ticketingStackView.spacing = 10.0
        
        [
            titleLabelContentsStackViwe,
//            userRatingContentsStackView,
//            actorContentsStackView,
//            directorContentsStackView,
            pubDateContentsStackView,
            audiAccumulateContentsStackView,
            audiCountContentsStackView
        ].forEach { contentsStackView.addArrangedSubview($0) }
        
        [imageView, contentsStackView, ticketingStackView]
            .forEach { view.addSubview($0) }
        
        [
            cgvButton,
            megaboxButton,
            lotteButton
        ].forEach { ticketingStackView.addArrangedSubview($0) }
        
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
        
        ticketingStackView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.leading)
            $0.trailing.equalTo(imageView.snp.trailing)
            $0.top.equalTo(contentsStackView.snp.bottom).offset(10)
        }
    }
    
}

protocol MovieDetailProtocol: AnyObject {
    
}
