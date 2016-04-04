//
//  Players.swift
//  QuestShow
//
//  Created by admin on 04/04/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

class Players {
    
    var name:String!
    var score:Int!
    var difficult:String!
    
    init(name:String, difficult:String){
        self.name = name
        self.difficult  = difficult
        self.score = 0
    }
    
    func scorePlus(){
        self.score = self.score + 1
    }
}