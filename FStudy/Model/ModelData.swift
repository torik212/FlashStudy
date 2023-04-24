//
//  ModelData.swift
//  FStudy
//
//  Created by Tori Kestel on 2/12/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    //@Published var cardsets: [Cardset] = load("cardData.json")
    @Published var cardsets: [Cardset] = load("cardData.json")
    //@Published var cardsets2: [Cardset] = load("cardData2.json")

    //@Published var cK: [Cardset] = load("student.json")
    
    //var hikes: [Hike] = load("hikeData.json")
        //Because you’ll never modify hike data after initially loading it,
        //you don’t need to mark it with the @Published attribute.

}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

