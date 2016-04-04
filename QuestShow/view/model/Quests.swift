//
//  Quests.swift
//  QuestShow
//
//  Created by admin on 01/04/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

class Quests: NSObject, NSCoding {
    //pergunta
    var quest:String!
    //alternativas
    var answer1:String!
    var answer2:String?
    var answer3:String?
    //questao correta
    var correct:String!
    
    init(q:String, a:String){
        self.correct = a
        self.quest = q
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.quest = aDecoder.decodeObjectForKey("quest") as! String
        self.correct = aDecoder.decodeObjectForKey("correct") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.quest , forKey: "quest")
        aCoder.encodeObject(self.correct, forKey:  "correct")
    }
    
}