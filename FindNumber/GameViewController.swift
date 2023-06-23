//
//  GameViewController.swift
//  FindNumber
//
//  Created by Polya Soloveva on 23/6/23.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var buttans: [UIButton]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
     

       
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        sender.isHidden = true
        print(sender.currentTitle)
    }
    
    

}
