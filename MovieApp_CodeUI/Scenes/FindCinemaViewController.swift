//
//  FindCinemaViewController.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/08/29.
//

import UIKit
import WebKit

final class FindCinemaViewController: UIViewController {
    
    var webView = WKWebView()
    
    override func loadView() {
        super.loadView()
        
        webView = WKWebView(frame: self.view.frame)
        self.view = self.webView
    }
    
    //TODO: CoreLocation 추가하기(내위치 확인)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        let urlKorString = "https://m.map.naver.com/search2/search.naver?query=영화관&sm=shistory&style=v5"
        let urlString = urlKorString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func setupNavigationBar() {
        navigationItem.title = "영화관 찾기 🔎"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}
