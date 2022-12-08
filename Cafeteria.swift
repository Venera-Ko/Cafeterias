//
//  Cafeteria.swift
//  LGStarter
//
//  Created by V K on 08.12.2022.
//

import Foundation

enum CafeteriaRating {
    case terrible, bad, moderate, good, great
}

class Cafeteria {
    var name: String
    var isFavourite: Bool
    var rating: CafeteriaRating
    
    init(name: String, isFavourite: Bool, rating: CafeteriaRating) {
        self.name = name
        self.isFavourite = isFavourite
        self.rating = rating
    }
    
    func getRatingString() -> String {
        switch rating {
        case .terrible: return "Terrible"
        case .bad:      return "Bad"
        case .moderate: return "Moderate"
        case .good:     return "Good"
        case .great:    return "Great"
        }
    }
}
