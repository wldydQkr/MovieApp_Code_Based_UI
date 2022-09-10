//
//  MoveToCgvViewController.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/09/09.
//

import UIKit
import SafariServices

final class MoveToCgvViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showCgv()
    }
    
    func showCgv() {
        if let url = URL(string: "https://m.cgv.co.kr/WebApp/Reservation/QuickResult.aspx?MovieIdx=") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
}
