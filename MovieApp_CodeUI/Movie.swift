//
//  Movie.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/08/30.
//

import Foundation

struct Movie: Codable {

    let boxOfficeResult: BoxofficeResult

}

struct BoxofficeResult: Codable {

    let dailyBoxOfficeList: [DailyBoxOfficeList]

}

struct DailyBoxOfficeList: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case movieNm, audiCnt, audiAcc, rank, openDt
    }
    
    let movieNm: String
    let audiCnt: String
    let audiAcc: String
    let rank: String
    let openDt: String
}
