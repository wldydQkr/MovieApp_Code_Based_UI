//
//  Movie.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/08/30.
//

import Foundation

struct MovieData: Codable {
    
    let boxOfficeResult: BoxofficeResult
    
}

struct BoxofficeResult: Codable {
    
    let dailyBoxOfficeList: [DailyBoxOfficeList]
    
}

struct DailyBoxOfficeList: Codable {
    
    let movieNm: String
    let audiCnt: String
    let audiAcc: String
    let rnum: String
    
}
