//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Kosha Patel on 8/11/17.
//  Copyright © 2017 Kosha Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = 1 // player 1 is always X
    
    var stateOfGame = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    
    
    @IBAction func action(_ sender: Any) {
        
        if(stateOfGame[(sender as AnyObject).tag-1] == 0) {
            
            stateOfGame[(sender as AnyObject).tag-1] = currentPlayer // fixes player overriding the state of game
            
            if(currentPlayer == 1) {
                
                (sender as AnyObject).setImage(UIImage(named: "X.png"), for: UIControlState())
                
                currentPlayer = 2
                
            } else {
                
                (sender as AnyObject).setImage(UIImage(named: "O.png"), for: UIControlState())
                
                currentPlayer = 1
        
            }
        
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

