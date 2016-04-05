//
//  Hanking.swift
//  QuestShow
//
//  Created by admin on 04/04/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

class Hanking {
    var list:Array<Players>!
    var file:String!
    
    init(){
        
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        
        self.file = "\(path)/data_show_user"
        
        if let obj = NSKeyedUnarchiver.unarchiveObjectWithFile(self.file){
            self.list = obj as! Array<Players>
        }else{
            self.list = Array<Players>()
        }
        
    }
    
    
    //retornando o objeto requisitado da lista
    func get(index:Int)-> Players{
        return self.list[index]
    }
    
    //adicionando novo elemento da lista
    func add(el:Players){
        self.list.append(el)
        //atualizando o arquivo com as alterações
        NSKeyedArchiver.archiveRootObject(self.list, toFile: self.file)
    }
    
    //organizer
    func organize(){
        self.list.sortInPlace({ $0.score > $1.score })
    }
    
    //quantidade de elementos da LISTA
    func count()->Int{
        return self.list.count
    }
    
    
    //removendo elemento do list
    func remove(index:Int){
        self.list.removeAtIndex(index)
        NSKeyedArchiver.archiveRootObject(self.list, toFile: self.file)
    }
}