////
////  buttonpractice.swift
////  FStudy
////
////  Created by Tori Kestel on 2/14/23.
////
//
import Foundation
import SwiftUI
import CoreLocation

struct NoteCflip: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false

    var filteredCardsets: [Cardset] {
        modelData.cardsets.filter { cardset in
            (!showFavoritesOnly || cardset.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
//                ForEach(filteredCardsets) { cardset in
//                    NavigationLink {
//                        CardsetDetail(cardset: cardset)
//                    } label: {
//                        CardsetRow(cardset: cardset)
//                    }
//                }
            }
            .navigationTitle("Cardsets")
        }
    }
}

    struct NoteCflip_Previews: PreviewProvider {
        static var cardsets = ModelData().cardsets
        static var previews: some View {
            CardsetList()
                .environmentObject(ModelData())
        }
    }

import UIKit

class ViewController: UIViewController {

    @IBAction func createFile(_ sender: Any) {
        let fileManager = FileManager.default
        let documentDirectory = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let fileURL = documentDirectory.appendingPathComponent("example.txt")

        let text = "Hello, world!"

        do {
            try text.write(to: fileURL, atomically: false, encoding: .utf8)
            print("File created successfully")
        } catch {
            print("Error creating file: \(error)")
        }
    }

}

