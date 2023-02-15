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
struct Words: Hashable, Codable{
    var w: String
    var def: String
    var id: Double
}
struct Cardset: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool

     var coordinates: Coordinates
    //var words: Words
    //var words: Words
    // var words: [Words]
//    var locationCoordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(
//            latitude: coordinates.latitude,
//            longitude: coordinates.longitude)
//    }
//    struct Coordinates: Hashable, Codable {
//        var latitude: Double
//        var longitude: Double
//    }
}



