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
    
    @IBOutlet weak var timerLable: UILabel!
    
    @IBOutlet weak var newGameButton: UIButton!
    
    lazy var game = Game(countItems: buttans.count) { [weak self] status, time in
        guard let self = self else {return}
        
        self.timerLable.text = time.secondToString()
        self.updateInfoGame(with: status)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        game.stopGame()
    }
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
    
    @IBAction func newGame(_ sender: UIButton) {
        game.newGame()
        sender.isHidden = true
        setupScreen()
    }
    private func setupScreen(){
        
        for index in game.items.indices {
            buttans[index].setTitle(game.items[index].title, for: .normal)
            //buttans[index].isHidden = false
            buttans[index].alpha = 1
            buttans[index].isEnabled = true
        }
        
        nextDigit.text = game.nextItem?.title
        
        
    }
    
    private func updateUI(){
        for index in game.items.indices {
            //buttans[index].isHidden = game.items[index].isFound
            buttans[index].alpha = game.items[index].isFound ? 0 : 1
            buttans[index].isEnabled = !game.items[index].isFound
            
            if game.items[index].isError {
                UIView.animate(withDuration: 0.3) { [weak self] in
                    self?.buttans[index].backgroundColor = .red
                } completion: { [weak self] _ in
                    self?.buttans[index].backgroundColor = .white
                    self?.game.items[index].isError = false
                }
            }
        }
        nextDigit.text = game.nextItem?.title
        
        updateInfoGame(with: game.status)
    }
    private func updateInfoGame(with status: StatusGame){
        switch status{
        case .start:
            statusLable.text = "Game start!"
            statusLable.textColor = .white
            newGameButton.isHidden = true
        case .win:
            statusLable.text = "You win!"
            statusLable.textColor = .green
            newGameButton.isHidden = false
            if game.isNewRecord {
                showAlert()
            } else {
                showAlertActionSheet()
            }
        case .lose:
            statusLable.text = "You lose!"
            statusLable.textColor = .red
            newGameButton.isHidden = false
            showAlertActionSheet()
        }
            
    }

    private func showAlert() {
        let alert = UIAlertController(title: "Congratulation", message: "New Record!", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okayAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func showAlertActionSheet(){
        let alert = UIAlertController(title: "What do you want to do?", message: nil, preferredStyle: .actionSheet)
        let newGameAction = UIAlertAction(title: "Start New game", style: .default) { [weak self] (_) in
            self?.game.newGame()
            self?.setupScreen()
        }
        
        let showRecord = UIAlertAction(title: "Show Record", style: .default) { (_) in
            // TODO! - RECORD VIEW CONTROLLER
            
        }
        
        let menuAction = UIAlertAction(title: "Go to Menu", style: .destructive) { [weak self] (_) in
            self?.navigationController?.popViewController(animated: true)
        }
        
        let canselAction = UIAlertAction(title: "Cansel", style: .cancel, handler: nil)
        
        alert.addAction(newGameAction)
        alert.addAction(showRecord)
        alert.addAction(menuAction)
        alert.addAction(canselAction)
        
        if let popover = alert.popoverPresentationController{
            popover.sourceView = statusLable

        }
        
        present(alert, animated: true, completion: nil)
        
    }
}
