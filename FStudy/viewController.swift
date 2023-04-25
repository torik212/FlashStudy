//
//  viewController.swift
//  FStudy
//
//  Created by Tori Kestel on 5/2/23.
//

import Foundation
import Firebase

var ref: DatabaseReference!

func viewDidLoad(){
    ref = Database.database().reference()
    
}

