//
//  ViewController.swift
//  QuestShow
//
//  Created by admin on 01/04/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lbDifficulty: UILabel!
    @IBOutlet weak var swDifficulty: UISlider!
    
    var strDifficult:String?
    
    let DIFFICULTY = ["Easy", "Medium", "Hard"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "QuestShow"
        
        self.strDifficult = "Easy"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func changeDifficulty(sender: AnyObject) {
        
        let val = swDifficulty.value
        
        if(val < 1){
            lbDifficulty.text = DIFFICULTY[0]
            
            self.strDifficult = "Easy"
            
            self.swDifficulty.tintColor = UIColor(red: 0.545, green: 0.765, blue: 0.29, alpha: 1)
        }else if(val > 1 && val < 2){
            lbDifficulty.text = DIFFICULTY[1]
            
            self.strDifficult = "Medium"
            
            self.swDifficulty.tintColor = UIColor(red: 1, green: 0.757, blue: 0.027, alpha: 1)
        }else if(val > 2 && val < 3){
            lbDifficulty.text = DIFFICULTY[2]
            
            self.strDifficult = "Hard"
            
            self.swDifficulty.tintColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "questshownow"){
            
            if self.fName == nil{
                self.fName.text = "Anonymus"
            }
            
            
            let view = segue.destinationViewController as! QuestViewController
            view.player = Players(name: self.fName.text!, difficult: self.strDifficult!)
        }
        
    }
    

}

