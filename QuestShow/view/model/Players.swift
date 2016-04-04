//
//  Players.swift
//  QuestShow
//
//  Created by admin on 04/04/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

class Players: NSObject, NSCoding {
    
    var name:String!
    var score:Int!
    var difficult:String!
    var life:Int!
    
    init(name:String, difficult:String){
        self.name = name
        self.difficult  = difficult
        self.score = 0
        
        switch(self.difficult){
        case "Easy":
            self.life = 2
        case "Medium":
            self.life = 1
        case "Hard":
            self.life = 0
        default:
            self.life = 2
        }
    }
    
    func scorePlus(){
        self.score = self.score + 1
    }
    
        
    func lessLife(){
        self.life = self.life - 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.difficult = aDecoder.decodeObjectForKey("difficult") as! String
        self.life = aDecoder.decodeObjectForKey("life") as! Int
        self.score = aDecoder.decodeObjectForKey("score") as! Int
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name , forKey: "name")
        aCoder.encodeObject(self.difficult, forKey:  "difficult")
        aCoder.encodeObject(self.score, forKey:  "score")
        aCoder.encodeObject(self.life, forKey:  "life")

    }
}