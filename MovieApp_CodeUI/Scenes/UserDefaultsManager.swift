//
//  UserDefaultsManager.swift
//  MovieApp_CodeUI
//
//  Created by 박지용 on 2022/08/30.
//

import Foundation

protocol USerDefaultsManagerProtocol {
    func getMovies() -> [Movie]
}

struct UserDefaultsManager: USerDefaultsManagerProtocol {
    enum Key: String {
        case movie
    }
    
    func getMovies() -> [Movie] {
        guard let data = UserDefaults.standard.data(forKey: Key.movie.rawValue) else { return [] }
        
        return (try? PropertyListDecoder().decode([Movie].self, from: data)) ?? []
    }
    
}
