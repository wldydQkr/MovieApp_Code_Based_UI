//
//  MoveToLottecinemaViewController.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/09/09.
//

import UIKit
import SafariServices

final class MoveToLotteCinemaViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLottecinema()
        
    }
    
    func showLottecinema() {
        if let url = URL(string: "https://www.lottecinema.co.kr/NLCMW/Ticketing/Cinema") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
}
