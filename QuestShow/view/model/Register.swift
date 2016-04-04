//
//  Register.swift
//  QuestShow
//
//  Created by admin on 01/04/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

class Register {
    
    var listQuests:Array<Quests>!
    var file:String!
    
    init(){
        
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        
        self.file = "\(path)/data_show"
        
        if let obj = NSKeyedUnarchiver.unarchiveObjectWithFile(self.file){
            self.listQuests = obj as! Array<Quests>
        }else{
            self.listQuests = Array<Quests>()
        }
        
        /**
            organizando as outras respostas
        **/
        self.organizeAnswers()
    }
    
    //coloca as alternativas de forma aleatoria, onde as erradas sao certas de outras perguntas
    func organizeAnswers(){
        let count = self.listQuests.count
        let random = Int(arc4random_uniform(UInt32(count)))
        
        if(count > 3){
            for(var i = 0; i < count; i++){
                self.listQuests[i].answer1 = self.listQuests[random].correct
                
                if count == random {
                    self.listQuests[i].answer2 = self.listQuests[random-1].correct
                }else{
                    self.listQuests[i].answer2 = self.listQuests[random+1].correct
                }
                
                if count == random {
                    self.listQuests[i].answer3 = self.listQuests[random-1].correct
                }else{
                    self.listQuests[i].answer3 = self.listQuests[random+1].correct
                }
            }
        }
    }
    
    //retornando o objeto requisitado da lista
    func get(index:Int)-> Quests{
        return self.listQuests[index]
    }
    
    //adicionando novo elemento da lista 
    func add(el:Quests){
        self.listQuests.append(el)
        self.organizeAnswers()
        
        //atualizando o arquivo com as alterações
        NSKeyedArchiver.archiveRootObject(self.listQuests, toFile: self.file)
    }
    
    //quantidade de elementos da LISTA
    func count()->Int{
        return self.listQuests.count
    }
    
    
    //removendo elemento do list
    func remove(index:Int){
        self.listQuests.removeAtIndex(index)
        NSKeyedArchiver.archiveRootObject(self.listQuests, toFile: self.file)
    }
    
}