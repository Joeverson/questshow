//
//  QuestViewController.swift
//  QuestShow
//
//  Created by admin on 01/04/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class QuestViewController: UIViewController {
    
    var register:Register?

    //btns das responstas
    @IBOutlet weak var swOne: UISwitch!
    @IBOutlet weak var swTwo: UISwitch!
    @IBOutlet weak var swThree: UISwitch!
    
    //areas respequitivas onde vao ficar as respostas
    @IBOutlet weak var tOne: UITextView!
    @IBOutlet weak var tTwo: UITextView!
    @IBOutlet weak var tThree: UITextView!
    //texto onde vai ficar a pergunta
    @IBOutlet weak var tGeral: UITextView!
    //contagem de quests
    @IBOutlet weak var lbCountQuest: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.swOne.on = false
        self.swThree.on = false
        self.swTwo.on = false
        
        
        self.register = Register()
        
        //so alimentando quando estiver vazio a lista
        //if(self.register?.count() == 0 ){
            let q = Quests(q: "Qual o maior planeta do sistema solar?", a: "Júpiter")
            let q1 = Quests(q: "Quantos ossos tem o corpo humano?", a: "206")
            let q2 = Quests(q: "Qual o primeiro personagem de Walt Disney?", a: "Mickey Mouse.")
            let q3 = Quests(q: "Quem pintou o quadro Mona Lisa?", a: "Leonardo da Vinci")
            
            //alimentando inicialmente o sistema.
            self.register?.add(q)
            self.register?.add(q1)
            self.register?.add(q2)
            self.register?.add(q3)

        //}
      
        
        //alimentando com a primeira pergunta o game.
        self.tGeral.text = self.register?.get(1).quest
        self.tOne.text = self.register?.get(1).answer1
        self.tTwo.text = self.register?.get(1).answer2
        self.tThree.text = self.register?.get(1).answer3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btDone(sender: AnyObject) {
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
