//
//  GameViewController.swift
//  FindNumber
//
//  Created by Polya Soloveva on 23/6/23.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet var buttans: [UIButton]!
    
    
    @IBOutlet weak var nextDigit: UILabel!
    @IBOutlet weak var statusLable: UILabel!
    
    lazy var game = Game(countItems: buttans.count)

    override func viewDidLoad() {
        super.viewDidLoad()
        
    setupScreen()
        
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        guard let buttonIndex = buttans.firstIndex(of: sender) else { return }
        game.check(index: buttonIndex)
        
//        sender.isHidden = true
        print(sender.currentTitle)
        updateUI()
    }
    
    private func setupScreen(){
        
        for index in game.items.indices {
            buttans[index].setTitle(game.items[index].title, for: .normal)
            buttans[index].isHidden = false
        }
        
        nextDigit.text = game.nextItem?.title
        
        
    }
    
    private func updateUI(){
        for index in game.items.indices {
            buttans[index].isHidden = game.items[index].isFound
        }
        nextDigit.text = game.nextItem?.title
        if game.status == .win {
            statusLable.text = "You win!"
            statusLable.textColor = .green
        }
    }

}
