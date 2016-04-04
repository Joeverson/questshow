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
    var life:Int!
    
    init(name:String, difficult:String){
        self.name = name
        self.difficult  = difficult
        self.score = 0
    }
    
    func scorePlus(){
        self.score = self.score + 1
    }
    
    //nivel de lifes
    func nivelLife(){
        switch(self.difficult){
            case "easy":
                self.life = 3
            case "medium":
                self.life = 2
            case "hard":
                self.life = 1
            default:
                self.life = 3
        }
    }
    
    func lessLife(){
        self.life = self.life - 1
    }
}