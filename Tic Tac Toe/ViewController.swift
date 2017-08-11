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
    
    
    @IBOutlet weak var label: UILabel!
    
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
                
                    label.text = "X Won!"
                    
                } else {
               
                    label.text = "O Won!"
                }
                
                playAgainButton.isHidden = false
                
                label.isHidden = false 
            }
        }
        
        // check to see if player can still put a X or O
        activeGame = false
        for i in stateOfGame {
            
            if (i == 0) {
                
                activeGame = true
                break
            }

        }
        
        // if it is a draw
        
        if (activeGame == false) {
            
            label.text = "DRAW!"
            label.isHidden = false
            playAgainButton.isHidden = false
            
        }
    
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: Any) {
        
        // Resetting the game once there is winner 
        
        stateOfGame = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activeGame = true
        currentPlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        
        // Reset all the button images for new game 
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
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

