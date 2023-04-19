//
//  Cards.swift
//  FStudy
//
//  Created by Tori Kestel on 2/12/23.
//

//import Foundation
//import SwiftUI

//struct Cards: Hashable, Codable, Identifiable {
//    var id: Int
//    var name: String
//
//    private var c: C
//    struct C: Hashable, Codable {
//        var name: String
//        var description: String
//    }
//}
import Foundation
import SwiftUI
import CoreLocation

struct Coordinates: Hashable, Codable {
    var longitude: Double
    var latitude: Double

}
struct Wordsets: Hashable, Codable, Identifiable{
    var word1: String
    var def: String
    var id: Int
    var isFav: Bool
}
struct Cardset: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var description: String
    var isFavorite: Bool

    var coordinates: Coordinates
    var wordset: [Wordsets]
    //var wordsets: [Wordsets]
    //var observations: [Observation]

}



