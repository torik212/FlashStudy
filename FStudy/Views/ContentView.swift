//
//  ContentView.swift
//  FStudy
//
//  Created by Tori Kestel on 2/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0 // declare counter as a State variable
        var cardsets = ModelData().cardsets
        var body: some View {
            TabView {
                NoteCardFlip()
                    .environmentObject(ModelData())
                    .onAppear {
                    counter = 0
                }
                    .tabItem() {
                        Image(systemName: "note.text")
                        Text("Flash Cards")
                    }
            StudyList()
                .environmentObject(ModelData())
                .tabItem(){
                    Image(systemName: "folder")
                    Text("My Cards")
                 }
            newCard()
                .tabItem(){
                    Image(systemName: "plus")
                    Text("New")
                }
            StudyChoice()
                    .tabItem(){
                        Image(systemName:"note")
                       Text("Learn")
                    }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
