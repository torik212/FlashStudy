//
//  studying.swift
//  FStudy
//
//  Created by Tori Kestel on 5/6/23.
//

import SwiftUI

struct Studying: View {
    static var cardsets = ModelData().cardsets
    @EnvironmentObject var modelData: ModelData
    @State private var counter = 0
    @State private var showDetails = false
    @State private var cardsetData: [Cardset] = NoteCardFlip.cardsets
    @State private var isCorrect: Bool?
    @State private var definition: String = "" // Definition entered by the user
    var cardset: Cardset {
        return cardsetData[counter % cardsetData.count]
    }
    
    let menuItems = ["Biology 1", "English Test 1", "Spanish Test3", "Cards 4"]
    @State private var selectedMenuItem = "Biology 1"
    var body: some View {
        ZStack {
            VStack {
                Menu {
                    Text("Select Cardset")
                    ForEach(menuItems, id: \.self) { item in
                        Button(item) {
                            self.selectedMenuItem = item
                            if item == "English Test 1" {
                                cardsetData = load("cardData2.json")
                                counter = 0 // reset the counter to start from the beginning of the new cardset
                                showDetails = false
                            } else if item == "Spanish Test3" {
                                cardsetData = load("cardData3.json")
                                counter = 0
                                showDetails = false
                            } else if item == "Biology 1" {
                                cardsetData = load("cardData.json")
                                counter = 0
                                showDetails = false
                            }
                        }
                    }
                } label: {
                    Text(selectedMenuItem)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .frame(maxWidth: .infinity, alignment: .top) // Align menu item to the top center of the screen
                .foregroundColor(.black)
                
                Spacer()
                
                VStack {
                    Text(cardset.name)
                        .frame(maxWidth: .infinity, alignment: .center) // Center align the cardset name
                    
                    TextField("Enter definition", text: $definition)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    HStack{
                        Button("Show Answer") {
                            showDetails.toggle()
                            
                        }
                        .foregroundColor(.white)
                        .padding(15.0)
                        .background(Color.gray)
                        .cornerRadius(10)
                        Button(action: {
                            checkDefinition()
                        }) {
                            Text("Submit")
                                .foregroundColor(.white)
                                .padding(15.0)
                                .background(Color.gray)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                                        
                    Text(isCorrect == true ? "Correct!" : "")
                        .foregroundColor(.green)
                        .padding(.top)
                                
                    Text(isCorrect == false ? "Incorrect!" : "")
                        .foregroundColor(.red)
                        .padding(.top)
                }
                .frame(maxWidth: .infinity, alignment: .center) // Center align the VStack
                if showDetails {
                    Text(cardset.description)
                        //.font(.title3)
                        .fontWeight(.light)
                        .font(.body)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 400)
                }
                Spacer()
            }
            .gesture(DragGesture(minimumDistance: 10, coordinateSpace: .global)
                        .onEnded({ value in
                            if value.translation.width < 0 { // swipe left
                                if counter < NoteCardFlip.cardsets.count - 1 {
                                    counter += 1
                                    showDetails = false
                                }
                            } else if value.translation.width > 0 { // swipe right
                                if counter > 0 {
                                    counter -= 1
                                    showDetails = false
                                }
                            }
                        }) )
            .background(Color(hue: 0.733, saturation: 0.074, brightness: 0.935))
        }
    }
    private func checkDefinition() {
        isCorrect = cardset.description.compare(definition, options: .caseInsensitive) == .orderedSame
    }
}

struct studying_Previews: PreviewProvider{
    static var cardsets = ModelData().cardsets
    static var counter = 0
    static var previews: some View {
        Studying()
        .environmentObject(ModelData())
        .onAppear {
            counter = 0
            
        }
    }
}
