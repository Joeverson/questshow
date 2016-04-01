//
//  Quests.swift
//  QuestShow
//
//  Created by admin on 01/04/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

class Quests: NSObject, NSCoding {
    var quest:String!
    var answer1:String!
    var answer2:String?
    var answer3:String?
    
    init(q:String, a:String){
        self.answer1 = a
        self.quest = q
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.quest = aDecoder.decodeObjectForKey("quest") as! String
        self.answer1 = aDecoder.decodeObjectForKey("answer1") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.quest , forKey: "quest")
        aCoder.encodeObject(self.answer1, forKey:  "answer1")
    }
    
}