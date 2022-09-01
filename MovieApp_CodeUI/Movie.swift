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
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        movieNm = try container.decodeIfPresent(String.self, forKey: .movieNm) ?? "-"
//        audiCnt = try container.decodeIfPresent(String.self, forKey: .audiCnt) ?? "-"
//        audiAcc = try container.decodeIfPresent(String.self, forKey: .audiAcc) ?? "-"
//        rnum = try container.decodeIfPresent(String.self, forKey: .rnum) ?? "-"
//    }
//
//    init(movieNm: String,
//        audiCnt: String,
//        audiAcc: String,
//        rnum: String
//    ) {
//        self.movieNm = movieNm
//        self.audiCnt = audiCnt
//        self.audiAcc = audiAcc
//        self.rnum = rnum
//    }
    
}
