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

struct Cardset: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var isFavorite: Bool

}



