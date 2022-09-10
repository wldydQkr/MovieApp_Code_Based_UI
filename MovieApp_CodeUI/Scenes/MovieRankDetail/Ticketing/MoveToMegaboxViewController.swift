//
//  MoveToMegaboxViewController.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/09/09.
//

import UIKit
import SafariServices

final class MoveToMegaboxViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showMegabox()
    }
    
    func showMegabox() {
        if let url = URL(string: "https://m.megabox.co.kr/booking/privatebooking") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
}
