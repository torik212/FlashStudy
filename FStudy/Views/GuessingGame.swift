//
//  GuessingGame.swift
//  FStudy
//
//  Created by Tori Kestel on 5/9/23.
//
import SwiftUI

struct GuessingGame: View {
    static var cardsets = ModelData().cardsets
    @EnvironmentObject var modelData: ModelData
    @State private var cardsetData: [Cardset] = NoteCardFlip.cardsets
    @State private var isCorrect: Bool?
    @State private var counter = 0
    @State private var randomIndex: Int = 0
    @State private var otherCardset: String = ""
    let menuItems = ["Biology 1", "English Test 1", "Spanish Test3", "Cards 4"]
    var cardset: Cardset {
        return cardsetData[counter % cardsetData.count]
    }
    
    init() {
        _otherCardset = State<String>(initialValue: generateRandomDescription())
    }
    
    func checkAnswer(selectedWord: String) {
        isCorrect = selectedWord.lowercased() == cardset.description.lowercased()
    }
    
    func generateRandomIndex() {
        var newIndex = Int.random(in: 0..<cardsetData.count)
        while cardsetData[newIndex].description == otherCardset {
            newIndex = Int.random(in: 0..<cardsetData.count)
        }
        randomIndex = newIndex
    }
    
    func generateRandomDescription() -> String {
        var randomIndex = Int.random(in: 0..<cardsetData.count)
        var othercardset = cardsetData[randomIndex]
        while (othercardset.description == cardset.description) {
            randomIndex = Int.random(in: 0..<cardsetData.count)
            othercardset = cardsetData[randomIndex]
        }
        return othercardset.description
    }
    @State private var selectedMenuItem = "Biology 1"
    var body: some View {
        ZStack{
            Menu {
                Text("Select Cardset")
                ForEach(menuItems, id: \.self) { item in
                    Button(item) {
                        self.selectedMenuItem = item
                        if item == "English Test 1" {
                            cardsetData = load("cardData2.json")
                            counter = 0 // reset the counter to start from the beginning of the new cardset
                        } else if item == "Spanish Test3" {
                            cardsetData = load("cardData3.json")
                            counter = 0
                        } else if item == "Biology 1" {
                            cardsetData = load("cardData.json")
                            counter = 0
                        }
                    }
                }
            } label: {
                Text(selectedMenuItem)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .padding(.top, -299)
            .foregroundColor(.black)
            
            VStack {
                Text(cardset.name)
                    .font(.title)
                    .padding()
                
                HStack {
                    Button(action: {
                        checkAnswer(selectedWord: cardset.description)
                    }) {
                        Text(cardset.description)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding()
                    
                    Button(action: {
                        checkAnswer(selectedWord: otherCardset)
                    }) {
                        Text(otherCardset)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding()
                }
                
                Text(isCorrect == nil ? "" : isCorrect == true ? "Correct!" : "Incorrect!")
                    .font(.headline)
                    .foregroundColor(isCorrect == true ? .green : .red)
                    .padding()
                
                Button(action: {
                    isCorrect = nil
                    counter += 1
                    otherCardset = generateRandomDescription()
                }) {
                    Text("Next Cardset")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(10)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.733, saturation: 0.074, brightness: 0.935))
    }
}

struct GuessingGame_Preview: PreviewProvider{
    static var cardsets = ModelData().cardsets
    static var counter = 0
    static var previews: some View {
        GuessingGame()
        .environmentObject(ModelData())
        .onAppear {
            counter = 0
            
        }
    }
}
