//
//  ModelData.swift
//  FStudy
//
//  Created by Tori Kestel on 2/12/23.
//

import Foundation
import Combine
import FirebaseDatabase
import Firebase

final class ModelData: ObservableObject {
    @Published var cardsets: [Cardset] = load("cardData.json")
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
//func writeDataToDatabase() {
//    // Load data from cardData.json
//    guard let fileURL = Bundle.main.url(forResource: "cardData", withExtension: "json"),
//          let data = try? Data(contentsOf: fileURL) else {
//        print("Failed to load JSON data")
//        return
//    }
//
//    do {
//        // Decode JSON data into an array of Cardset objects
//        let decoder = JSONDecoder()
//        let cardsets = try decoder.decode([Cardset].self, from: data)
//
//        // Configure Firebase
//        FirebaseApp.configure()
//
//        // Get a reference to the database
//        let ref = Database.database().reference()
//
//        // Write each Cardset object as a child node in the "studySets" location
//        for cardset in cardsets {
//            ref.child("studySets").childByAutoId().setValue(cardset.dictionaryRepresentation) { error, _ in
//                if let error = error {
//                    print("Error writing data to database: \(error)")
//                } else {
//                    print("Data written to database successfully")
//                }
//            }
//        }
//    } catch {
//        print("Error decoding JSON data: \(error)")
//    }
//}
//
//extension Cardset {
//    // Helper method to convert Cardset object to a dictionary
//    var dictionaryRepresentation: [String: Any] {
//        return [
//            "id": id,
//            "name": name,
//            "description": description,
//            "isFavorite": isFavorite,
//        ]
//    }
//}
//func fetchDataFromDatabase() {
//    let ref = Database.database().reference()
//
//    // Read data from a specific location in the database
//    ref.child("studySets").observe(.value) { snapshot in
//        // Handle the data snapshot
//        // Access the data using snapshot.value
//        // Update your SwiftUI model or view with the retrieved data
//    }
//}

