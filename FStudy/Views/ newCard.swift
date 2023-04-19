//
//  newCard.swift
//  FStudy
//
//  Created by Tori Kestel on 2/20/23.
//
import SwiftUI

struct newCard: View {
    @State var words: [(word: String, def: String)] = []
    @State var newWord: String = ""
    @State var newDef: String = ""
    @State var showAlert = false
    @State var fileName = URL(fileURLWithPath: "example")

    var body: some View {
        ZStack {
            Color.purple.opacity(0.09)

            NavigationView {
                Form {
                    Section(header: Text("Add New Word")) {
                        TextField("Word", text: $newWord)
                        TextField("Definition", text: $newDef)
                        Button(action: addWord) {
                            Text("Add")
                        }
                        .foregroundColor(Color.blue.opacity(0.70))
                    }

                    Section(header: Text("Words")) {
                        ScrollView{
                            ForEach(words, id: \.word) { word in
                                VStack(alignment: .leading) {
                                    Text("\(word.word): \(word.def)")
                                }
                            }
                        }
                    }

                }
                .foregroundColor(Color.black.opacity(0.7))
                .navigationBarTitle("New Words")
                .navigationBarItems(trailing: Button("Save Set", action: {
                    showAlert = true
                })
                    .foregroundColor(Color.green.opacity(0.80)))
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Save Word List"),
                          message: Text("Enter a name for your word list"),
                          primaryButton: .default(Text("Save"), action: {
                            do {
                                let dictionary = Dictionary(uniqueKeysWithValues: words.map{ ($0.word, $0.def) })
                                let fileURL = try FileManager.default
                                    .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                                    .appendingPathComponent("\(fileName).json")

                                try JSONSerialization.data(withJSONObject: dictionary)
                                    .write(to: fileURL)
                                print("File created at: \(fileURL.path)")
                                words = []
                            } catch {
                                print(error)
                            }
                          }),
                          secondaryButton: .cancel(Text("Cancel")))
                    
                }
                                    
            }
    }

}
    func addWord() {
        words.append((word: newWord, def: newDef))
        newWord = ""
        newDef = ""
    }



//    func saveWords() {
//        var dictionaries: [[String: Any]] = []
//        for word in words {
//            let dictionary: [String: Any] = ["word": word.word, "definition": word.def]
//            dictionaries.append(dictionary)
//        }
//
//        do {
//            let currentDirURL = URL(fileURLWithPath: #file)
//                .deletingLastPathComponent()
//            let fileURL = currentDirURL
//                .appendingPathComponent("example.json")
//
//            try JSONSerialization.data(withJSONObject: dictionaries)
//                .write(to: fileURL)
//            print("File created at: \(fileURL.path)")
//        } catch {
//            print(error)
//        }
//
//        words.removeAll()
//    }
}


struct newCard_Previews: PreviewProvider {
    static var previews: some View {
        newCard()
    }
}

