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
    
    let winningPatterns = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var activeGame = true
    
    
    
    @IBAction func action(_ sender: Any) {
        
        // continues the game if if there is no winner
        
        if(stateOfGame[(sender as AnyObject).tag-1] == 0 && activeGame == true) {
            
            stateOfGame[(sender as AnyObject).tag-1] = currentPlayer // fixes player overriding the state of game
            
            if(currentPlayer == 1) {
                
                (sender as AnyObject).setImage(UIImage(named: "X.png"), for: UIControlState())
                
                currentPlayer = 2
                
            } else {
                
                (sender as AnyObject).setImage(UIImage(named: "O.png"), for: UIControlState())
                
                currentPlayer = 1
        
            }
        
        }
        
        for pattern in winningPatterns {
            if stateOfGame[pattern[0]] != 0 && stateOfGame[pattern[0]] == stateOfGame[pattern[1]] && stateOfGame[pattern[1]] == stateOfGame[pattern[2]] {
                
                activeGame = false; // stop the game if winner is present
                
                if stateOfGame[pattern[0]] == 1 {
                    // X has won
                    print("cross")
                } else {
                    // O has won
                    print("o")
                }
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

