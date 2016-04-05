//
//  QuestViewController.swift
//  QuestShow
//
//  Created by admin on 01/04/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class QuestViewController: UIViewController {
    
    var game:Game!

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
    
    //valor correto escolhido
    var correct:String?
    
    //objeto com as informaçoes do jogador
    var player:Players!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.swOne.on = false
        self.swThree.on = false
        self.swTwo.on = false
        
        
        self.game = Game(player: self.player)
        
        
        
        //alimentando com a primeira pergunta o game.
        self.tGeral.text = self.game?.quest
        self.tOne.text = self.game?.answer
        self.tTwo.text = self.game?.answer2
        self.tThree.text = self.game?.answer3
        
        
        //atualizando com o banco de dados de servidor
        self.searchBuscape()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func btDone(sender: AnyObject) {
        
        if self.game!.validation(self.correct!) {
            //quantidades de perguntas
            self.lbCountQuest.text = String(Int(self.lbCountQuest.text!)! + 1)

            //mudando a perguntas e alternativas
            self.tGeral.text = self.game?.quest
            self.tOne.text = self.game?.answer
            self.tTwo.text = self.game?.answer2
            self.tThree.text = self.game?.answer3
            
            //zerando as opcoes
            swOne.on = false
            swTwo.on = false
            swThree.on = false
            
            print(self.game?.player.name)
            print(self.game?.player.score)
            print(self.game?.player.life)
            
            
        }else{
            if self.game!.lose() {
                self.game.addPlayerForHanking()
                self.navigationController?.popViewControllerAnimated(true)
            }else{
                self.game?.player.lessLife()
                
                
                let alert = UIAlertController(title: "Eitxa", message: "Voce errou, voce tem \(self.game.player.life) chances", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    
    
    
    
    /**
    avaliando quais botoes estao ativos e desativando se houver mais de
    um ativo
    **/
    
    @IBAction func btnOne(sender: AnyObject) {
        swTwo.on = false
        swThree.on = false
        
        correct = tOne.text
    }
    @IBAction func btnTwo(sender: AnyObject) {
        swOne.on = false
        swThree.on = false
        correct = tTwo.text
    }
    @IBAction func btnThree(sender: AnyObject) {
        swOne.on = false
        swTwo.on = false
        correct = tThree.text
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func searchBuscape() {
        guard
            let url = NSURL(string:  "http://314.bl.ee/api.php?q=\(self.game.register.count())")
            
            else { return }
        NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            guard
                let httpURLResponse = response as? NSHTTPURLResponse where httpURLResponse.statusCode == 200,
                let data = data where error == nil
                else { return }
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                var error: NSError?
                
                let json = JSON(data: data, options: .AllowFragments, error: &error)
                
                //apresenta o erro caso haja no server
                if let error = error {
                    print(error.localizedDescription)
                }
                
                //print(json)
                
                //joga as informacoes que vinheram do servidor e coloca no register
                for(var i = 0; i < json["data"].count; i++){
                    self.game.register.add(Quests(q: String(json["data"][i]["quest"]), a: String(json["data"][i]["answer"])))
                    print(String(json["data"][i]["quest"]))
                }
                
                
            }
        }).resume()
    }
    
    
}
